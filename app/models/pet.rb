class Pet < ApplicationRecord
  validates :name, presence: true
  belongs_to :household
  has_many :events, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :care_reminders, dependent: :destroy
  belongs_to :owner, class_name: "User"

end
