# frozen_string_literal: true

class PropertyDetailsSerializer < ActiveModel::Serializer
  attributes :id, :bedrooms, :bathrooms, :area, :description, :photo_urls, :active, :operation_type, :owner_id
  belongs_to :property_type
  belongs_to :address
end
