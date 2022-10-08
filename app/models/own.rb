# frozen_string_literal: true

class Own < ApplicationRecord
  belongs_to :user
  belongs_to :ownable, polymorphic: true

  def property_details
    Rails.application.eager_load!
    model = ApplicationRecord.descendants.find {|model| model.name==ownable_type}
    prop = model.find(ownable_id)
    a = Property.find(prop.property_id)
    b = a.operation_type
    a.as_json(except: %i[created_at updated_at]).merge!({operation_type: b.as_json})
  end
  
end
