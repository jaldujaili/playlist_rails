class Song < ActiveRecord::Base
  belongs_to  :artist
  has_many    :playlist_songs, foreign_key: :song_id, inverse_of: :song
  has_many    :playlists, through: :playlist_songs
  belongs_to  :album

end
