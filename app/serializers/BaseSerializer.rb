require 'jsonapi-serializers'

class BaseSerializer
  include JSONAPI::Serializer

  def unformat_name(attribute_name)
    attribute_name.to_s.underscore
  end

end