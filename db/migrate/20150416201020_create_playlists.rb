class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string   :title
      t.integer  :user_id

      t.timestamps null: false
    end
    add_index :playlists, :title
    add_index :playlists, :user_id
  end
end
