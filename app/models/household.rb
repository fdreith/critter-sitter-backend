class Household < ApplicationRecord
  has_secure_password
  has_many :user_households
  belongs_to :owner, class_name: :User, foreign_key: 'owner_id'
  has_many :users, through: :user_households

end
