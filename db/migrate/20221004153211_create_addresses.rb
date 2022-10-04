class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.text :references
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false

      t.timestamps
    end
  end
end
