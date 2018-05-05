source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Explicitly declare the ruby version
ruby '2.3.4'

# Bootstrap for styling
gem 'bootstrap', '~> 4.0.0.beta3'
gem "bootstrap_form",
    git: "https://github.com/bootstrap-ruby/rails-bootstrap-forms.git",
    branch: "master"
# For authorization
gem 'cancancan', '~> 2.0'
# Chart.JS for javascript charts
gem 'chart-js-rails'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use devise for authentication
gem 'devise'
# Use Faker for test data
gem 'faker'
# For icons
gem 'font-awesome-sass', '~> 4.7.0'
# GraphQL for API
gem 'graphql'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Loofah is required for sanitize, manually update to safe version
gem 'loofah', '~> 2.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# For recacptcha in the sign up form
gem 'recaptcha', require: 'recaptcha/rails'
# Red carpet gem for markdown support
gem 'redcarpet'
# error reporting
gem 'rollbar'
# This is for progress bars in rake tasks that take forever
gem 'ruby-progressbar'
# Sanitize filters out harmful stuff from uploaded html files
gem 'sanitize', '~> 4.6.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Selectize for UI tags
gem 'selectize-rails'
# travis CI to automate deploys
gem 'travis'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Use pry for debugging
  gem 'pry', '~> 0.10.3'
  # rspec for tests
  gem 'rspec-rails', '~> 3.7'
  # factorybot for test data
  gem 'factory_bot_rails', '~> 4.0'
  # simplecov analyzes test coverage; necessary for code climate test coverage feature
  gem 'simplecov', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'graphiql-rails', group: :development