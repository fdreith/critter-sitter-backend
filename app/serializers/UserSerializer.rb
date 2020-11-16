require 'jsonapi-serializers'

class UserSerializer
  include JSONAPI::Serializer

  attribute :first_name
  attribute :last_name
  attribute :email
  
  has_many :households, through: :user_households,  include_links: false, include_data: true
  has_many :owned_households, class_name: "Household", foreign_key: "owner_id",  include_links: false, include_data: true
  has_many :owned_pets, class_name: "Pet", foreign_key: "owner_id",  include_links: false, include_data: true
  has_many :events,  include_links: false, include_data: true

end