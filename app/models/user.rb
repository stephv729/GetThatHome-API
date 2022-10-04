class User < ApplicationRecord
  belongs_to :role
  has_many :owns, dependent: :destroy
  has_many :saved_properties, dependent: :destroy

  # validates :name :unique
end
