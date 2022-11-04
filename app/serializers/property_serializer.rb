# frozen_string_literal: true

class PropertySerializer < ActiveModel::Serializer
  attributes :id, :bedrooms, :bathrooms, :area, :photo_urls, :active, :operation_type, :updated_at
  belongs_to :property_type
  belongs_to :address
end
