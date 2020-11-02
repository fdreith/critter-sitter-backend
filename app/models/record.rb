class Record < ApplicationRecord
  belongs_to :pet
  validates :record_type, presence: true
end
