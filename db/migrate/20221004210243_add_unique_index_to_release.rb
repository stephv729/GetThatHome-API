# frozen_string_literal: true

class AddUniqueIndexToRelease < ActiveRecord::Migration[7.0]
  def change
    add_index :addresses, %i[latitude longitude], unique: true
  end
end
