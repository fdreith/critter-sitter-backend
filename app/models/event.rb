class Event < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :type, presence: true

end
