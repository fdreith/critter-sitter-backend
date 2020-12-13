class RecordSerializer < BaseSerializer
  attribute :record_type
  attribute :name
  attribute :details
  attribute :attachment
  attribute :date
  

  belongs_to :pet, serializer: :pet, foreign_key: 'pet_id'
  belongs_to :user, serializer: :user, foreign_key: 'user_id'


end