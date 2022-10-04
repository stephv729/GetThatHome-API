class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :address
  has_many :property_users
end
