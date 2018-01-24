class AddMmrToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :solo, :integer
  	add_column :users, :party, :integer
  	add_column :users, :fantasy, :integer
  end
end
