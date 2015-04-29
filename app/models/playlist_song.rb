class PlaylistSong < ActiveRecord::Base
  belongs_to :playlist, foreign_key: "playlist_id", inverse_of: :playlist_songs
  belongs_to :song    , foreign_key: "song_id", inverse_of: :playlist_songs
end
