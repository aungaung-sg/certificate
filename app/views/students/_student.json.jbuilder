json.extract! student, :id, :code, :name, :created_at, :updated_at
json.url student_url(student, format: :json)
