class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  
  def index
    if current_user.admin?
        if sort_column == "title"
          @resources = Student.search(params[:user_id] ).course_ordered(sort_direction).page(params[:page]).per(params[:per])
        else
          @resources = Student.search(params[:user_id] ).reorder(sort_column + " " + sort_direction).page(params[:page]).per(params[:per])
        end
        respond_to do |format|
          format.html
          format.csv { send_data @resources.to_csv }
          format.xls  #{ send_data @products.to_csv(col_sep: "\t") }
        end
    else
      @resources = Student.search(params[:search]).reorder(sort_column + " " + sort_direction).where(user_id: current_user.id).page(params[:page]).per(params[:per])
      render :user_index
    end
  end
  
  def course_data
    if params[:user_id] == '1' 
      @select_course = Course.all
    else
      @select_course = Course.where(user_id: params[:user_id])
    end
    respond_to do |format|
      format.json { render json: @select_course }
    end
  end

  def bulk_print
    @pdf_resources = Student.where(id: params[:student_ids])
    @pdf_resources.each do |pdf| 
      pdf.update(status: 'complete')
      pdf.save!
    end
    pdf = StudentPdf.new(@pdf_resources)
    send_data pdf.render,
              filename: "student_#{Time.now}",
              type: 'application/pdf',
              disposition: 'inline'
  end

  def show
    @student = Student.find(params[:id])
    if current_user.admin?
      @student.update(status: 'complete')
      @student.save!
    end
    respond_to do |format|
      format.html
      format.json { head :no_content }
      format.pdf do
        pdf = StudentPdf.new([@student])
        send_data pdf.render,
                  filename: "student_#{@student.name}",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end

  def new
    @student = current_user.students.build(status: 'imcomplete')
  end

  def edit
  end

  def create
    if current_user.admin?
      @student = Student.new(student_params)
    else
      @student = current_user.students.build(student_params)
    end
    @student.status = 'imcomplete'
    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_url, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:code, :name, :course_id, :user_id, :student_ids)
    end

    def sort_column
      params[:sort].present? ? params[:sort] : "created_at"
    end
      
    def sort_direction
      params[:direction].present? ? params[:direction] : "desc"
    end
end
