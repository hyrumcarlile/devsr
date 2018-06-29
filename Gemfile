source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.4'

gem 'administrate'
gem 'bootsnap'
gem 'bootstrap', '~> 4.0.0.beta3'
gem 'bootstrap_form',
    git: 'https://github.com/bootstrap-ruby/rails-bootstrap-forms.git',
    branch: 'master'
gem 'cancancan', '~> 2.0'
gem 'chart-js-rails'
gem 'coffee-rails'
gem 'devise'
gem 'faker'
gem 'friendly_id', '~> 5.1.0'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'graphql'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'loofah', '~> 2.2.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.6'
gem 'react-rails', '~> 1.7', '>= 1.7.1'
gem 'rails-html-sanitizer', '~> 1.0.4'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'redcarpet'
gem 'rollbar'
gem 'ruby-progressbar'
gem 'sanitize', '~> 4.6.3'
gem 'sass-rails', '~> 5.0'
gem 'sendgrid-ruby'
gem 'selectize-rails'
gem 'sinatra', '~> 2.0.2'
gem 'travis'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 3.5', '>= 3.5.3'

group :development, :test do
  gem 'pry', '~> 0.10.3'
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'graphiql-rails', group: :development
