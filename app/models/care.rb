class Care < ApplicationRecord
  enum care_type: [:event, :reminder, :record]
  validates :name, presence:true
  belongs_to :pet
  belongs_to :user
end
