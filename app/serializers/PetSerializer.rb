require 'jsonapi-serializers'

class PetSerializer
  include JSONAPI::Serializer

  attribute :name
  attribute :care

  has_one :household, include_data: true, include_links: false 
  has_many :events, include_data: true, include_links: false 
  has_many :records, include_data: true, include_links: false 
  has_many :care_reminders, include_data: true, include_links: false 
  has_one :owner, class_name: "User", include_data: true, include_links: false 

end