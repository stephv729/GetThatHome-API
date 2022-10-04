class PropertyForSale < ApplicationRecord
  belongs_to :property
  has_one :own, as: :ownable, dependent: :destroy

  # validations
  validates :price, numericality: { greater_than: 0 }, presence: true
end
