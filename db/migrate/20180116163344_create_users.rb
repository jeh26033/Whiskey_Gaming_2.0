class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :nickname
      t.string :avatar_url
      t.string :profile_url
	  add_index :users, :uid, unique: true
      t.timestamps
    end
  end
end
