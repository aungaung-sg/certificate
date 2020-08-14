class StudentImport
    # switch to ActiveModel::Model in Rails 4
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations
  
    attr_accessor :file
  
    def initialize(attributes = {})
      attributes.each { |name, value| send("#{name}=", value) }
    end
  
    def persisted?
      false
    end
  
    def save
      if imported_students.map(&:valid?).all?
        imported_students.each(&:save!)
        true
      else
        imported_students.each_with_index do |student, index|
          student.errors.full_messages.each do |message|
            errors.add :base, "Row #{index+2}: #{message}"
          end
        end
        false
      end
    end
  
    def imported_students
      @imported_students ||= load_imported_students
    end
  
    def load_imported_students
      spreadsheet = open_spreadsheet
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        product = Student.find_by_id(row["id"]) || Student.new
        product.attributes = row.to_hash.slice(*Student.column_names)
        product
      end
    end
  
    def open_spreadsheet
      case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, packed: false, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
  end