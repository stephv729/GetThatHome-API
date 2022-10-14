# frozen_string_literal: true

class SavedPropertySerializer < ActiveModel::Serializer
  attributes :id, :favorite, :contacted, :property_details

  def property_details
    PropertySerializer.new(object.property, root: false)
  end
end
