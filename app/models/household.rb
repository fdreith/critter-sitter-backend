class Household < ApplicationRecord
  validates :name, uniqueness:true
  validates :name, presence:true
  has_secure_password
  has_many :user_households, :dependent => :destroy
  belongs_to :owner, class_name: :User, foreign_key: 'owner_id'
  has_many :users, through: :user_households
  has_many :pets, :dependent => :nullify

end
