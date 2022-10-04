class Address < ApplicationRecord
  has_many :properties
  
  # validations
  validates :name, :latitude, :longitude, presence :true
  validates :latitude, uniqueness: { scope: :longitude }

end
