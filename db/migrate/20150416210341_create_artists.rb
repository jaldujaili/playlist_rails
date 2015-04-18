class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :playlist_id

      t.timestamps null: false
    end
    add_index :artists, :name
    add_index :artists, :playlist_id
  end
end
