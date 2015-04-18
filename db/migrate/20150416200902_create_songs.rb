class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string  :title
      t.integer :length
      t.string  :genre
      t.integer :playlist_id
      t.integer :artist_id
      t.integer :album_id

      t.timestamps null: false
    end
    add_index :songs, :playlist_id
    add_index :songs, :artist_id
    add_index :songs, :album_id
  end
end
