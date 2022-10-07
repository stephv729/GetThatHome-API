# frozen_string_literal: true

class SavedProperty < ApplicationRecord
  belongs_to :user
  belongs_to :property

  after_update :clean

  private

  def clean
    self.destroy unless favorite || contacted
  end
end
