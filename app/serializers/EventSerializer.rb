class EventSerializer < BaseSerializer
  attribute :event_type
  attribute :name
  attribute :details
  attribute :date
  attribute :created_at

  # undefined method for has one attached
  # has_one_attached :attachment

  belongs_to :pet
  belongs_to :user


end