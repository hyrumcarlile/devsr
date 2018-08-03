# This model tracks the list of skills users can endorse eachother on.
class Skill < ApplicationRecord
  has_many :endorsements
  has_many :notes

  validates_presence_of :name
  validates_presence_of :image_url
end
