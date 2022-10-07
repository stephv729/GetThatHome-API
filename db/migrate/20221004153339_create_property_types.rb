# frozen_string_literal: true

class CreatePropertyTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :property_types do |t|
      t.string :name, index: {unique: true}

      t.timestamps
    end
  end
end
