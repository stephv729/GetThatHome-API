class User < ApplicationRecord
  belongs_to :role
  has_many :owns
  has_many :saved_properties

  # validates :name :unique
end
