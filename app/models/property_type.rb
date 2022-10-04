class PropertyType < ApplicationRecord
  has_many :properties

    # Validations

    validates :name, presence: true, uniqueness: false
end
