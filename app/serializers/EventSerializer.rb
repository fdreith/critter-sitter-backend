class EventSerializer < BaseSerializer
  attribute :event_type
  attribute :name
  attribute :details
  attribute :attachment
  attribute :date
  attribute :created_at
  has_one_attached :attachment
  

  belongs_to :pet, serializer: :pet, foreign_key: 'pet_id'
  belongs_to :user, serializer: :user, foreign_key: 'user_id'


end