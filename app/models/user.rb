class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many :user_households
  has_many :households, through: :user_households

  has_many :owned_households, class_name: "Household", foreign_key: "owner_id"
  
end
