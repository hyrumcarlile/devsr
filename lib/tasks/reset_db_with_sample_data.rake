namespace :db do
  desc 'Drop, create, migrate, and seed  database'
  task prepare: [:drop, :create, 'schema:load', :seed] do
    puts 'Ready to go!'
  end
end