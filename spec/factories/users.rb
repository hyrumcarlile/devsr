require 'faker'

FactoryBot.define do
  factory :user do
    email                 'admin@admintest.com'
    password              '123456'
    password_confirmation '123456'
    role                  'end_user'
  end

  factory :admin, class: User do
    email                 'user@user.com'
    password              '123456'
    password_confirmation '123456'
    role                  'administrator'
  end

  factory :search_user, class: User do
    email                 email
    name                  name
    password              '123456'
    password_confirmation '123456'
    role                  'end_user'
  end
end