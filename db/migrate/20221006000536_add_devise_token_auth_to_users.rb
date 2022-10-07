class AddDeviseTokenAuthToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :provider, :string, :null => false, :default => "email"
    add_column :users, :uid, :string, :null => false, :default => ""
    add_column :users, :tokens, :text
  end

  def down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_column :users, :tokens
  end
end