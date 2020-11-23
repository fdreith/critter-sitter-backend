class CareReminderSerializer < BaseSerializer

  attribute :care_type
  attribute :details
  attribute :date

  has_one :pet, include_data: true, include_links: false 

end