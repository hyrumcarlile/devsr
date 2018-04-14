class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :achievements
  has_one :achievement_criterium
  has_many :endorsers,     class_name:  'Endorsement',
                           foreign_key: 'endorsee_id',
                           dependent:   :destroy
  has_many :endorsees,     class_name:  'Endorsement',
                           foreign_key: 'endorser_id',
                           dependent:   :destroy
  has_many :notes,         dependent:   :destroy
  has_many :skill_ratings, dependent:   :destroy
  has_many :votes,         dependent:   :destroy

  before_save :create_avatar

  # List of roles a user can be (for permissions)
  enum role: [:end_user, :administrator]

  def self.administrator?
    self.role.eql? 1 ? true : false
  end

  def self.search(search)
    where('lower(name) LIKE ?', "%#{search.downcase}%")
  end

  def create_avatar
    self.avatar_url = "https://robohash.org/#{email}?gravatar=yes"
  end

  def skill_labels
    # Sort the skills by rating highest to lowest
    sr = skill_ratings.sort_by(&:rating).reverse!
    sr.map(&:skill).map(&:name).to_json
  end

  def skill_values
    # Sort the skills by rating highest to lowest
    sr = skill_ratings.sort_by(&:rating).reverse!
    sr = sr.map(&:rating)
    sr.map(&:to_f)
  end

  def top_skills
    # Returns the user's top three skills
    skill_ratings.sort_by(&:rating).last(3).map(&:skill).map(&:name).reverse!
  end

  def recent_notes
    # Returns the 3 most recently updated notes
    notes.order('updated_at').last(3)
  end

  def after_database_authentication
    # Check for consecutive logins here
  end
end
