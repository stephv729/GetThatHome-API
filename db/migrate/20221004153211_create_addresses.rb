class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.text :references
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
