class HouseholdSerializer < BaseSerializer
  attribute :name
  attribute :address
  
  has_many :user_households
  belongs_to :owner, serializer: :user, foreign_key: 'owner_id'
  has_many :users, through: :user_households
  has_many :pets


end