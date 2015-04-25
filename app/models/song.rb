class Song < ActiveRecord::Base
  belongs_to  :artist
  has_many    :playlist_songs
  has_many    :playlists, through: :playlist_songs
  belongs_to  :album

end
