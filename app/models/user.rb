class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :endorsers, class_name:  'Endorsement',
                       foreign_key: 'endorsee_id',
                       dependent:   :destroy
  has_many :endorsees, class_name:  'Endorsement',
                       foreign_key: 'endorser_id',
                       dependent:   :destroy
  has_many :notes,     dependent:   :destroy

  before_save :create_avatar

  def create_avatar
    self.avatar_url = "https://robohash.org/#{email}?gravatar=yes"
  end
end
