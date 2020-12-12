class CareSerializer < BaseSerializer
  attirbute :care_type
  attribute :name
  attribute :details
  attribute :photo
  attribute :date
  

  belongs_to :pet
  belongs_to :user


end