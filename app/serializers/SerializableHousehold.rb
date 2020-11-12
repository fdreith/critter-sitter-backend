class SerializableHousehold < JSONAPI::Serializable::Resource
  type 'households'

  attributes :name, :address

  belongs_to :owner, class_name: :User, foreign_key: 'owner_id'
  has_many :users, through: :user_households
  has_many :pets

  #owner and users

  link :self do
    href "http://localhost:3000/api/v1/households/#{@object.id}"
  end


end
