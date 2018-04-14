# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'Admin',
  email: 'admin@admin.com',
  username: 'admin',
  role: 1,
  password: 'password',
  password_confirmation: 'password'
)

User.create!(
  name: 'User',
  email: 'user@user.com',
  username: 'user',
  role: 0,
  password: 'password',
  password_confirmation: 'password'
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
    {name: 'Party Parrot', description: '10 Unique (not on the same day) Logins', icon_name: 'bronze-min.png'},
    {name: 'Party Corgi', description: '100 Unique (not on the same day) Logins', icon_name: 'silver-min.png'},
    {name: 'Party Wizard', description: '1000 Unique (not on the same day) Logins', icon_name: 'gold-min.png'},
    {name: 'Pest Control', description: 'Resolved an issue labeled &quot;Bug&quot; on GitHub', icon_name: 'bug-min.png'},
    {name: 'Founder', description: 'One of the first 100 contributers to devSR', icon_name: 'goblet-min.png'},
    {name: 'Lifesaver', description: 'Resolved an issue labeled &quot;Urgent&quot; on GitHub', icon_name: 'lifesaver-min.png'},
    {name: 'Lightbulb', description: 'Came up with an idea for devSR that got implemented', icon_name: 'lightbulb-min.png'}
]

skills.each do |s|
  Skill.create(name: s)
end

acheivements.each do |a|
  Achievement.create(name: a[:name], description: a[:description], icon_name: a[:icon_name])
end

5.times do
  begin
    User.first.achievements << Achievement.find(rand(1..Achievement.count))
  # For duplicate achievements
  rescue NameError
  rescue PG::UniqueViolation
  rescue ActiveRecord::RecordNotUnique
  end
end