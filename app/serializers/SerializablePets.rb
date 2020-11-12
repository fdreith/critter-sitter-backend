class SerializablePet < JSONAPI::Serializable::Resource
  type 'pets'

  attributes :name, :care

  #owner and house

    belongs_to :household
  has_many :events
  has_many :records
  has_many :care_reminders
  belongs_to :owner, class_name: "User"

  link :self do
    href "http://localhost:3000/api/v1/pets/#{@object.id}"
  end


end