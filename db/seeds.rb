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

acheivements = [
    {name: 'Party Parrot', description: '10 Consecutive Daily Logins', icon_name: 'bronze-min.png'},
    {name: 'Party Corgi', description: '100 Consecutive Daily Logins', icon_name: 'silver-min.png'},
    {name: 'Party Wizard', description: '1000 Consecutive Daily Logins (do you need a hobby?)', icon_name: 'gold-min.png'},
    {name: 'Pest Control', description: 'Resolved an issue labeled \"Bug\" on GitHub', icon_name: 'bug-min.png'},
    {name: 'Founder', description: 'One of the first 100 contributers to devSR', icon_name: 'goblet-min.png'},
    {name: 'Lifesaver', description: 'Resolved an issue labeled \"Urgent\" on GitHub', icon_name: 'lifesaver-min.png'},
    {name: 'Lightbulb', description: 'Came up with an idea for devSR that got implemented', icon_name: 'lightbulb-min.png'}
]

skills.each do |s|
  Skill.create(name: s)
end

acheivements.each do |a|
  Achievement.create(name: a[:name], description: a[:description], icon_name: a[:icon_name])
end