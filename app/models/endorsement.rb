class Endorsement < ApplicationRecord
  before_save :calculate_endorsement_value
  before_save :increment_rating
  before_destroy :decrement_rating

  # These are optional because endorser_id and endorsee_id are required.
  # This will prevent multiple error messages for the same issue.
  belongs_to :endorser, class_name: 'User', optional: true
  belongs_to :endorsee, class_name: 'User', optional: true

  belongs_to :skill
  belongs_to :note

  validates :endorser_id, :presence => true
  validates :endorsee_id, :presence => true

  validate :you_cannot_endorse_yourself

  # validates_uniqueness_of :endorser_id, scope: [:endorsee_id, :skill_id, :note_id]

  def you_cannot_endorse_yourself
    if endorsee_id == endorser_id
      errors.add(:email, 'You cannot endorse yourself')
    end
  end

  def calculate_endorsement_value
    Algorithms.calculate_endorsement_value self
  end

  def increment_rating
    # Before saving an endorsement, increment the endorsees sr in that skill,
    # as well as their overall sr.
    sr = SkillRating.find_by(user_id: endorsee_id, skill_id: skill_id)
    if sr.nil?
      SkillRating.create!(
          user_id: endorsee_id,
          skill_id: skill_id,
          rating: endorsement_value
      )
    else
      sr.rating += endorsement_value
      sr.save
    end
    endorsee.rating += endorsement_value
    endorsee.save
  end

  def decrement_rating
    # Before destroying an endorsement, decrement the endorsees sr in that skill (if
    # it exists) and decrement their overall sr.
    sr = SkillRating.find_by(user_id: endorsee_id, skill_id: skill_id)
    unless sr.nil?
      sr.rating -= endorsement_value
      sr.save
    end
    endorsee.rating -= endorsement_value
    endorsee.save
  end

  # Needed to display an email field in the form and then use that email
  # in the controller logic
  attr_accessor :email
  attr_accessor :skill
end