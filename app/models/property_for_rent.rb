class PropertyForRent < ApplicationRecord
  belongs_to :property
  has_one :own, as: :ownable, dependent: :destroy

  # Validations

  validates :monthly_rent, presence: true, uniqueness: false
  validates :maintenance, presence: true, uniqueness: false
  validates :pets_allowed, presence: true, uniqueness: false
end
