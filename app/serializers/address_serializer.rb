# frozen_string_literal: true

class AddressSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :name
end
