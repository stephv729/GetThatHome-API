class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :address
  has_many :saved_properties, dependent: :destroy

  # validations
  validates :area, :active, :description, presence: true
  validates :bedrooms, :bathrooms, :area, numericality: { greater_than_or_equal_to: 0}

end
