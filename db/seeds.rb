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

# Sections
Section.destroy_all
5.times.each.with_index(1) do |d|
  t = Time.parse('7:30 am')
  while t < Time.parse('10:00 pm')
    duration = [50, 80].sample
    subject = Subject.all.sample
    teacher = subject.teachers.sample
    start_at = t.strftime('%k:%M')
    end_at = (t + duration.minutes).strftime('%k:%M')
    if Section.where('start_at <= ? AND end_at > ? AND weekdays LIKE ?', start_at, end_at, "%#{d}%").empty?
      Section.create(
        repeat_type: ['everyday', 'mwf', 'tt'].sample,
        teacher: teacher,
        subject: subject,
        room: Room.all.sample,
        start_at: start_at,
        end_at: end_at,
        students: Student.all.sample(rand(Student.count) + 1)
      )
    end
    t += duration.minutes
  end
end
