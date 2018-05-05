# This model tracks the list of skills users can endorse eachother on.
class Skill < ApplicationRecord
  has_many :endorsements
end
