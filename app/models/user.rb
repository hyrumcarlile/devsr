class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :endorsers,     class_name:  'Endorsement',
                           foreign_key: 'endorsee_id',
                           dependent:   :destroy
  has_many :endorsees,     class_name:  'Endorsement',
                           foreign_key: 'endorser_id',
                           dependent:   :destroy
  has_many :notes,         dependent:   :destroy
  has_many :skill_ratings, dependent:   :destroy

  before_save :create_avatar

  def create_avatar
    self.avatar_url = "https://robohash.org/#{email}?gravatar=yes"
  end

  def skill_labels
    # Sort the skills by rating highest to lowest
    sr = self.skill_ratings.sort_by() { |sr| sr.rating }.reverse!
    sr.map(&:skill).map(&:name).to_json
  end

  def skill_values
    # Sort the skills by rating highest to lowest
    sr = self.skill_ratings.sort_by() { |sr| sr.rating }.reverse!
    sr = sr.map(&:rating)
    sr.map(&:to_f)
  end
end
