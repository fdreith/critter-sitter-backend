class RecordSerializer < BaseSerializer

  attribute :event_type
  attribute :details
  attribute :created_at

  has_one :pet, include_data: true, include_links: false 

end