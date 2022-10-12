class AddUniqueIndexToSavedProperty < ActiveRecord::Migration[7.0]
  def change
    add_index :saved_properties, [:user_id, :property_id], unique: true
  end
end
