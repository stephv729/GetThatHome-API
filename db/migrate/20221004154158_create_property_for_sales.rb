class CreatePropertyForSales < ActiveRecord::Migration[7.0]
  def change
    create_table :property_for_sales do |t|
      t.references :property, null: false, foreign_key: true
      t.integer :price, null: false

      t.timestamps
    end
  end
end
