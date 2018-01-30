require 'ruby-progressbar'

namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:create, 'schema:load', :seed] do
    puts 'Ready to go!'
  end
end