class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :playlist_id
      t.integer :artist_id

      t.timestamps null: false
    end
    add_index :albums, :title
    add_index :albums, :playlist_id
    add_index :albums, :artist_id
  end
end
