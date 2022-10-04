class User < ApplicationRecord
  belongs_to :role
  has_many :owns
  has_many :property_users

  # validates :name :unique
end
