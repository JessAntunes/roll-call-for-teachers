# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do 
    Lecturer.create!(
        password: ENV['SECRET_PASSWORD'],
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.safe_email
    )
end

20.times do
    Course.create!(
        subject: Faker::Educator.course_name,
        lecturer_id: rand(1..3),
        day: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'].sample
    )
end

50.times do
    Student.create!(
        name: Faker::Name.first_name,
        email: Faker::Internet.free_email,
        degree: Faker::Educator.degree
    )

end

puts "Seeded and Succeeded"