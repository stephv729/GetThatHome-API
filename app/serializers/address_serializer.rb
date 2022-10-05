class AddressSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :name
end
