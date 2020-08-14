class StudentPdf < Prawn::Document
  require 'prawn-styled-text'
    def initialize(student)
      super(top_margin: 119, :page_layout => :portrait, :page_size => "A4" ) #[380, 500]
      @student = student
      header
      student_name
      signature
      code
    end
    def header
      styled_text '<div  style="text-align: center; size: 11;">A Recognized Centre of London Chamber of Commerce & Industry</div>'
      styled_text '<div style="text-align: center; size: 10;"> No.52, 19th St., Latha Tsp., Yangon. Tel: 382180</div>'
      styled_text '<div style="text-align: center; size: 10;"> E-mail: softguide.atn@gmail.com</div>'
      move_down 30
    end

    def student_name
        styled_text '<div style="text-align: center; size: 10;">This is to certify that</div>'
        move_down 10
        text " #{@student.name.upcase}", size: 11, style: :bold, align: :center
        move_down 10
        styled_text '<div style="text-align: center; size: 10;">has satisfactorily completed the course in </div>' 
        move_down 10
        text "<i><b>#{@student.course.name.upcase}</b></i>", size: 12, align: :center, :inline_format => true
        move_down 10
        text " #{@student.course.description}", size: 10, align: :center
    end
    def signature
      text_box 'Aung Than Nyunt, B.E (Mech:)', :at => [bounds.width - 160, bounds.top - 490], :width => 150, size: 10;
      text_box 'Founder and Principal', :at => [bounds.width - 160, bounds.top - 500], :width => 100, size: 10;
      text_box "Date of Issue   #{DateTime.now.strftime("%d %b %Y")}", :at => [bounds.width - 160, bounds.top - 520], :width => 150, size: 8;
    end
    def code
      text_box " #{rand(999).to_s(16).upcase}#{@student.id.to_s(16).upcase}#{rand(999).to_s(16).upcase}#{@student.code}", :at => [bounds.width - 160, bounds.top - 530], :width => 150, size: 8;
    end
  end