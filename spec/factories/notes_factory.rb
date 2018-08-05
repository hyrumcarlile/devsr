FactoryBot.define do
  factory :note do
    title "Test Title"
    subtitle "Test Subtitle"
    body "Test Body"
    is_private false
    comments_disabled false
    image_url "example.com"
    user
  end
end