class PropertyType < ApplicationRecord
  has_many :properties, dependent: :destroy
end
