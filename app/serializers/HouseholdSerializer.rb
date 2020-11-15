require 'jsonapi-serializers'

class HouseholdSerializer
  include JSONAPI::Serializer

  attribute :name
  attribute :address
  
  has_many :user_households
  has_one :owner, class_name: :User, foreign_key: 'owner_id', include_data: true, include_links: false 
  has_many :users, through: :user_households, include_data: true, include_links: false 
  has_many :pets, include_data: true, include_links: false 


end