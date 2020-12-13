class User < ApplicationRecord
  validates :email, presence:true, uniqueness:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  has_secure_password

  has_many :user_households, :dependent => :destroy
  has_many :households, through: :user_households
  has_many :owned_households, class_name: "Household", foreign_key: "owner_id"
  has_many :owned_pets, class_name: "Pet", foreign_key: "owner_id"
  has_many :records, :dependent => :nullify
  
end
