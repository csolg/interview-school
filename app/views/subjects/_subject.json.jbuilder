json.extract! subject, :id, :name, :description, :created_at, :updated_at
json.url subject_url(subject, format: :json)
join.teachers subject.teachers.map { |t| t.first_and_last_name }.join(', ')
