# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :address
  has_many :saved_properties, dependent: :destroy

  # validations
  validates :area, :active, :description, presence: true
  validates :bedrooms, :bathrooms, :area, numericality: { greater_than_or_equal_to: 0 }

  def operation_type
    for_sale = PropertyForSale.find_by(property_id: id)
    for_rent = PropertyForRent.find_by(property_id: id)
    if for_sale.present?
      { type: "for sale", price: for_sale.price }
    elsif for_rent.present?
      { type: "for rent", monthly_rent: for_rent.monthly_rent, maintenance: for_rent.maintenance,
        pets_allowed: for_rent.pets_allowed }
    end
  end
end
