# frozen_string_literal: true

class Address < ApplicationRecord
  has_many :properties, dependent: :destroy

  # validations
  validates :name, :latitude, :longitude, presence: true
end
