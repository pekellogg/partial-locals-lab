# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
80.times do
  Student.create(name: Faker::Name.name, hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
end
Classroom.create(course_name: 'Math', semester: "Spring #{Time.now.year}")
Classroom.create(course_name: 'English', semester: "Fall #{Time.now.year}")
Classroom.create(course_name: 'Science', semester: "Spring #{Time.now.year}")
Classroom.create(course_name: 'Chemistry', semester: "Fall #{Time.now.year}")


Classroom.all.each_with_index do |classroom, n|
  classroom.students << [Student.limit(8).offset(n*2)]
end

# 4 times total
# 0 - skip first 0 records
# 1 - skip first 2 records
# 2 - skip first 4 records
# 3 - skip first 6 records
# uniqueness per classroom is not required; classrooms 1-4 are populated with 8 students total, incrementing student id by 2 for each pass
