class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string  :title
      t.integer :length
      t.string  :genre

      t.timestamps null: false
    end
  end
end
