class CareReminder < ApplicationRecord
  belongs_to :pet
  validates :type, presence: true
  validates :date, presence: true

end
