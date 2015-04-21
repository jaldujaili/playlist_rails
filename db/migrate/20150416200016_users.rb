class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :password
    end
    add_index :users, :name
    add_index :users, :email,  unique: true
  end
end
