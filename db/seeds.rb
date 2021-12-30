Rails.logger = Logger.new(STDOUT)
Rake::Task['db:fixtures:load'].invoke

# Teachers
Teacher.destroy_all
20.times.each do |i|
  Teacher.create(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
  )
end

# Subjects
Subject.destroy_all
40.times.each do |i|
  Subject.create(
    name: FFaker::Education.major,
    description: FFaker::Lorem.paragraph,
    teachers: Teacher.all.sample(rand(Teacher.count) + 1)
  )
end

# Rooms
Room.destroy_all
50.times.each do |i|
  Room.create(
    name: 'Room ' + i.to_s
  )
end

# Students
Student.destroy_all
200.times.each do |i|
  Student.create(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
  )
end
