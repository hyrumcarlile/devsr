require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do

  name = Faker::Name.name
  email = Faker::Internet.unique.free_email(name)
  search_user = User.create( name: name,
                             email: email,
                             password: '123456',
                             password_confirmation: '123456',
                             role: 'end_user')

  describe '.administrator?' do
    context 'when given an administrator' do
      it 'should return true' do
        expect(build(:admin).administrator?)
            .to eql(true)
      end
    end
  end

  describe '.administrator?' do
    context 'when given a user' do
      it 'should return false' do
        expect(build(:user).administrator?)
            .to eql(false)
      end
    end
  end

  describe '.search' do
    context "when given the search term #{search_user.name}" do
      it "should return user with that name" do
        expect(User.search(search_user.name).first.id)
            .to eql(search_user.id)
      end
    end
  end

  describe '.create_avatar' do
    context "when given the user #{search_user.name}" do
      it "should return 'https://robohash.org/#{search_user.email}?gravatar=yes'" do
        expect(search_user.create_avatar)
            .to eql("https://robohash.org/#{search_user.email}?gravatar=yes")
      end
    end
  end



end
