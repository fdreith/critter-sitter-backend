class PetSerializer < BaseSerializer

  attribute :name
  attribute :care_instructions

  belongs_to :household
  has_many :events
  belongs_to :owner, serializer: :user, foreign_key: 'user_id'

end