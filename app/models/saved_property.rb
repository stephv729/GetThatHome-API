class SavedProperty < ApplicationRecord
  belongs_to :user
  belongs_to :property

  after_update :clean

  private

  def clean
    # Hace referencia que no tiene ni developer ni publisher y lo elimina si es el caso.
    SavedProperty.delete(self) unless self.favorite|| self.contacted
  end

end
