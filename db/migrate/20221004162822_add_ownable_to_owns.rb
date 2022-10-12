# frozen_string_literal: true

class AddOwnableToOwns < ActiveRecord::Migration[7.0]
  def change
    add_reference :owns, :ownable, polymorphic: true, null: false
  end
end
