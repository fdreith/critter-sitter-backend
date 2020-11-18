class Household < ApplicationRecord
  validates :name, uniqueness:true
  validates :name, presence:true
  #deleted has_secure_password because I am not sure that works for this...
  has_secure_password
  has_many :user_households
  belongs_to :owner, class_name: :User, foreign_key: 'owner_id'
  has_many :users, through: :user_households
  has_many :pets

end
