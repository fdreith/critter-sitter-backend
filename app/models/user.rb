class User < ApplicationRecord
  validates :email, presence:true, uniqueness:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  has_secure_password

  has_many :user_households
  has_many :households, through: :user_households
  has_many :pets, through: :household
  has_many :owned_households, class_name: "Household", foreign_key: "owner_id"
  has_many :owned_pets, class_name: "Pet", foreign_key: "owner_id"
  has_many :events
  
end
