class Pet < ApplicationRecord
  validates :name, presence: true
  belongs_to :household
  has_many :records, dependent: :destroy
  belongs_to :owner, class_name: "User"

end
