# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'Hyrum Carlile',
  email: 'hcarlile12@gmail.com',
  username: 'hyrumcarlile',
  role: 1,
  password: '123456',
  password_confirmation: '123456'
)

skills = [
    'Ruby',
    'Rails',
    'C++',
    'Java',
    'Python',
    'Go',
    'Django',
    'Elixr',
    'Swift',
    'Vapor',
    'MongoDB',
    'Postgresql',
    'MySQL',
    'SQLite'
]

skills.each do |s|
  Skill.create!(name: s)
end