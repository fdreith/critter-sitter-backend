class Event < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :event_type, presence: true

end
