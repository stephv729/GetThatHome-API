# frozen_string_literal: true

class SavedProperty < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :property_id, uniqueness: { scope: :user_id }

  after_update :clean

  private

  def clean
    self.destroy unless favorite || contacted
  end
end
