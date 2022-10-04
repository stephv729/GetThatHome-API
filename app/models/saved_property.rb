class SavedProperty < ApplicationRecord
  belongs_to :user
  belongs_to :property

  after_update :clean

  private

  def clean
    SavedProperty.delete(self) unless self.favorite|| self.contacted
  end

end
