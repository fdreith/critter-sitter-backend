class UserHouseholdSerializer < BaseSerializer

  belongs_to :user
  belongs_to :household
  
end