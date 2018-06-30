namespace :slugs do
  desc "Adds slugs to existing users"
  task add_slug_to_existing_users: :environment do
    User.find_each do |user|
      username = user.name.gsub(' ', '').downcase
      user.update(username: username)
    end
  end

  desc "Adds slugs to existing notes"
  task add_slug_to_existing_users: :environment do
    Note.find_each do |note|
      title = ::Faker::Lorem.sentence(3, true, 4)
      user.update(title: title)
    end
  end
end
