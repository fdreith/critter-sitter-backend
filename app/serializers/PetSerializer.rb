class PetSerializer < BaseSerializer

  attribute :name
  attribute :care_instructions

  belongs_to :household
  has_many :records
  belongs_to :owner, serializer: :user, class_name: "User"

end