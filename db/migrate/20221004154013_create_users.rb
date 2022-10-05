# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, index: {unique: true}
      t.string :phone, index: {unique: true}
      t.string :password
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
