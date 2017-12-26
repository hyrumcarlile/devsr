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
end
