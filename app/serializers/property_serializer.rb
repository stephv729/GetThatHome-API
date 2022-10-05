# frozen_string_literal: true

class PropertySerializer < ActiveModel::Serializer
  attributes :id, :bedrooms, :bathrooms, :area, :description, :photo_urls, :active, :operation_type
  belongs_to :property_type
  belongs_to :address
end
