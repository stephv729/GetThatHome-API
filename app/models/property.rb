class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :address
  has_many :saved_properties
end
