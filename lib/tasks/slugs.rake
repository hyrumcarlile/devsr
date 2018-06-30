namespace :slugs do
  desc "Adds slugs to existing users"
  task add_slug_to_existing_users: :environment do
    User.find_each do |user|
      username = user.name.gsub(' ', '').downcase
      user.update!(username: username)
    end
  end
end
