class CreateSavedProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_properties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.boolean :favorite, default: false
      t.boolean :contacted, default: false

      t.timestamps
    end
  end
end
