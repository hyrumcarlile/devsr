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
end