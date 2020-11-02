class CareReminder < ApplicationRecord
  belongs_to :pet
  validates :care_type, presence: true
  validates :date, presence: true

end
