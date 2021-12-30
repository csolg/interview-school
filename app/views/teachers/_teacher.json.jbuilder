json.extract! teacher, :id, :first_name, :last_name, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
json.classes teacher.classes.map { |c| c.name }.join(', ')
