# frozen_string_literal: true

class Own < ApplicationRecord
  belongs_to :user
  belongs_to :ownable, polymorphic: true

  def property_details
    Rails.application.eager_load!
    model = ApplicationRecord.descendants.find {|model| model.name==ownable_type}
    prop = model.find(ownable_id)
    prop = Property.find(prop.property_id)
    operation_type = prop.operation_type
    prop_type = PropertyType.find(prop.property_type_id).as_json(except: %i[created_at updated_at id])
    address = Address.find(prop.address_id).as_json(except: %i[created_at updated_at id])
    prop.as_json(except: %i[created_at updated_at property_type_id address_id]).merge!({
      operation_type: operation_type,
      property_type: prop_type,
      address: address
      })
  end
  
end
