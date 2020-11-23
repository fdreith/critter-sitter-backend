class CareReminderSerializer < BaseSerializer

  attribute :care_type
  attribute :details
  attribute :date

  belongs_to :pet
  belongs_to :user

end