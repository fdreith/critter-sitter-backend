class RecordSerializer < BaseSerializer

  attribute :event_type
  attribute :details
  attribute :created_at

  belongs_to :pet

end