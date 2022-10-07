# frozen_string_literal: true

class OwnSerializer < ActiveModel::Serializer
  attributes :id, :ownable_type, :ownable_id, :property_details
end
