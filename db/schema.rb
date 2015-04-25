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

ActiveRecord::Schema.define(version: 20150424183742) do

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

  create_table "playlist_songs", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "song_id"
  end

  add_index "playlist_songs", ["playlist_id"], name: "index_playlist_songs_on_playlist_id"
  add_index "playlist_songs", ["song_id"], name: "index_playlist_songs_on_song_id"

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
    t.integer  "artist_id"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id"
  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "password"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "auth_token",             default: ""
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
