# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :role
  has_many :owns, dependent: :destroy
  has_many :saved_properties, dependent: :destroy

  # Validations

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :phone, presence: true, uniqueness: true

  validates :password, presence: true
end
