class UserSerializer < BaseSerializer

  attribute :first_name
  attribute :last_name
  attribute :email
  
  has_many :households, through: :user_households
  has_many :owned_households, serializer: :household
  has_many :owned_pets, serializer: :pet, foreign_key: "owner_id"
  has_many :events

end