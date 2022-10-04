class Role < ApplicationRecord
  has_many :users

  # Validations

  validates :name, presence: true, uniqueness: true 
end
