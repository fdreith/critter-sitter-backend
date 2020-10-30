class Record < ApplicationRecord
  belongs_to :pet
  validates :type, presence: true
end
