class Pet < ApplicationRecord
  validates :name, presence: true
  belongs_to :household
  has_many :events
  has_many :records
  has_many :care_reminders
  belongs_to :owner, class_name: "User"

end
