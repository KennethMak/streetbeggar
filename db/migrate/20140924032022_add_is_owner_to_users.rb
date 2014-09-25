class AddIsOwnerToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_owner, :boolean, default: false, null: false
  end
end
