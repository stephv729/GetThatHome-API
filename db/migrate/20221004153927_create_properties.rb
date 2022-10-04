class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.references :address, null: false, foreign_key: true
      t.references :property_type, null: false, foreign_key: true
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :area
      t.text :description, null: false
      t.text :photo_urls, array: true, default: []
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
