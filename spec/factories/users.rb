require 'faker'

FactoryBot.define do
  FactoryBot.define do
    factory :user do
      email { ::Faker::Internet.unique.email }
      password "Password1"
      password_confirmation "Password1"
      name { ::Faker::Name.name }

      trait :with_role do
        transient do
          role_name nil
        end

        role { role_name }

      end
    end
  end

  # factory :user do
  #   email                 'admin@admintest.com'
  #   password              '123456'
  #   password_confirmation '123456'
  #   role                  'end_user'
  # end
  #
  # factory :admin, class: User do
  #   email                 'user@user.com'
  #   password              '123456'
  #   password_confirmation '123456'
  #   role                  'administrator'
  # end
  #
  # factory :search_user, class: User do
  #   email                 email
  #   name                  name
  #   password              '123456'
  #   password_confirmation '123456'
  #   role                  'end_user'
  # end
end