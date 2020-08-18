class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  # GET /themes
  # GET /themes.json
  def model 
    @model = Theme
  end
  def index
    @themes = model.all
  end

  # GET /themes/1
  # GET /themes/1.json
  def show
  end

  # GET /themes/new
  def new
    @theme = model.new
  end

  # GET /themes/1/edit
  def edit
  end

  # POST /themes
  # POST /themes.json
  def create
    @theme = model.new(theme_params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to themes_url, notice: 'Theme was successfully created.' }
        format.json { render :index, status: :created, location: themes_url }
      else
        format.html { render :new }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /themes/1
  # PATCH/PUT /themes/1.json
  def update
    current_user.theme = model.find(params[:id])
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to themes_url, notice: 'Theme was successfully updated.' }
        format.json { render :index, status: :ok, location: @themes }
      else
        format.html { render :edit }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_theme
    current_user.skip_validation = true
    current_user.theme_id = params[:theme_id]
    current_user.save(validate: false)
    @current_color = model.where(id: current_user.theme_id).pluck(:color_code)[0]
    @current_color = Theme.where(id: params[:theme_id]).pluck(:color_code)[0]
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @themes, color: @current_color,  notice: 'Theme was successfully updated.' }
    end
  end

  # DELETE /themes/1
  # DELETE /themes/1.json
  def destroy
    @theme.destroy
    respond_to do |format|
      format.html { redirect_to themes_url, notice: 'Theme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_params
      params.require(:theme).permit(:name, :color_code, :theme_id)
    end
end
