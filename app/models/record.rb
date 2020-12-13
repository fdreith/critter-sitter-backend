class Record < ApplicationRecord
  enum record_type: [:event, :reminder, :vet]
  validates :name, presence:true
  belongs_to :pet
  belongs_to :user
end
