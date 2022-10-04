class User < ApplicationRecord
  belongs_to :role
  has_many :owns
  has_many :saved_properties

  # Validations

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, uniqueness: false
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true, uniqueness: true

  validates :password, presence: true, uniqueness: false
end
