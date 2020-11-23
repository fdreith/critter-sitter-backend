class PetSerializer < BaseSerializer

  attribute :name
  attribute :care

  belongs_to :household
  has_many :events
  has_many :records
  has_many :care_reminders
  belongs_to :owner, serializer: :user, class_name: "User"

end