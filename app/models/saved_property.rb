# frozen_string_literal: true

class SavedProperty < ApplicationRecord
  belongs_to :user
  belongs_to :property

  after_update :clean

  private

  def clean
    SavedProperty.destroy(self) unless favorite || contacted
  end
end
