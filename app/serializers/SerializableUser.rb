class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :first_name, :last_name, :email

  link :self do
    href "http://localhost:3000/api/v1/users/#{@object.id}"
  end

  has_many :households, through: :user_households do 
    data do 
      @object.name
    end
  end

  has_many :pets, through: :household
  has_many :owned_households, class_name: "Household", foreign_key: "owner_id"
  has_many :owned_pets, class_name: "Pet", foreign_key: "owner_id"

end
