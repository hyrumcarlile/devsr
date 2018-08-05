require 'rails_helper'

RSpec.describe 'Skill', type: :model do
  let(:skill) { FactoryBot.create(:skill) }

  it "has a valid factory" do
    expect(::FactoryBot.build(:skill)).to be_valid
  end
end