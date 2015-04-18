# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150416210403) do

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.integer  "playlist_id"
    t.integer  "artist_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id"
  add_index "albums", ["playlist_id"], name: "index_albums_on_playlist_id"
  add_index "albums", ["title"], name: "index_albums_on_title"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.integer  "playlist_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "artists", ["name"], name: "index_artists_on_name"
  add_index "artists", ["playlist_id"], name: "index_artists_on_playlist_id"

  create_table "playlists", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "playlists", ["title"], name: "index_playlists_on_title"
  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id"

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.integer  "length"
    t.string   "genre"
    t.integer  "playlist_id"
    t.integer  "artist_id"
    t.integer  "album_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id"
  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id"
  add_index "songs", ["playlist_id"], name: "index_songs_on_playlist_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["name"], name: "index_users_on_name"

end
