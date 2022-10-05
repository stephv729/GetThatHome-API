class PropertySerializer < ActiveModel::Serializer
  attributes :id, :bedrooms, :bathrooms, :area, :description, :photo_urls, :active
  belongs_to :property_type
  belongs_to :address
end
