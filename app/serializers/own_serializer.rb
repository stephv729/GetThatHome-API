# frozen_string_literal: true

class OwnSerializer < ActiveModel::Serializer
  attributes :id, :ownable_type, :ownable_id, :property_details

  def property_details
    Rails.application.eager_load!
    model = ApplicationRecord.descendants.find {|model| model.name==object.ownable_type}
    prop_by_operation = model.find(object.ownable_id)
    PropertySerializer.new(prop_by_operation.property, root: false)
  end
end
