# frozen_string_literal: true

class PropertyType < ApplicationRecord
  has_many :properties, dependent: :destroy

  # Validations

  validates :name, presence: true, uniqueness: false

  def get_name_by_id(id)
    property = PropertyType.find(id)
    property.name
  end
end
