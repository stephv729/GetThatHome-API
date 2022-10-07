# frozen_string_literal: true

class PropertyForRent < ApplicationRecord
  belongs_to :property
  has_one :own, as: :ownable, dependent: :destroy

  # Validations

  validates :monthly_rent, :maintenance, numericality: { greater_than: 0 }, presence: true
  validates :pets_allowed, inclusion: [true, false]
end
