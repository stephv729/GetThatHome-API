class PropertyType < ApplicationRecord
  has_many :properties, dependent: :destroy

  # Validations

  validates :name, presence: true, uniqueness: false

end
