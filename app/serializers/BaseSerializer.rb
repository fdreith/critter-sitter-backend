# require 'jsonapi-serializers'

class BaseSerializer
  include JSONAPI::Serializer

  set_key_transform :underscore


end