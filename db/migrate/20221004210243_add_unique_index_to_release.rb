class AddUniqueIndexToRelease < ActiveRecord::Migration[7.0]
  def change
    add_index :addresses, [:latitude, :longitude], unique: true
  end
end
