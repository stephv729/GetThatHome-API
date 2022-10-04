class PropertyForRent < ApplicationRecord
  belongs_to :property
  has_one :own, as: :ownable, dependent: :destroy
end
