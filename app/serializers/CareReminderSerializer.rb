require 'jsonapi-serializers'

class CareReminderSerializer
  include JSONAPI::Serializer

  attribute :care_type
  attribute :details
  attribute :date

  has_one :pet, include_data: true, include_links: false 

end