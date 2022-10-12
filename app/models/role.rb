# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users, dependent: :destroy

  # Validations

  validates :name, presence: true, uniqueness: true
end
