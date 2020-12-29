class Event < ApplicationRecord
  enum event_type: [:care, :reminder, :vet]
  validates :name, presence:true
  belongs_to :pet
  belongs_to :user

  has_one_attached :image
end
