class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :address
  has_many :saved_properties, dependent: :destroy

  # validations
  validates :active, :description, :photo_urls, presence :true
  validates :bedrooms, :bathrooms, :area, numericality: { greater_than: 0}

end
