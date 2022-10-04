class CreatePropertyForRents < ActiveRecord::Migration[7.0]
  def change
    create_table :property_for_rents do |t|
      t.references :property, null: false, foreign_key: true
      t.integer :monthly_rent
      t.integer :maintenance
      t.boolean :pets_allowed

      t.timestamps
    end
  end
end
