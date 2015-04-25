FactoryGirl.define do
  factory :playlist_song do
    song_id {rand(1..Song.all.size)}
    playlist_id {rand(1..Playlist.all.size)}
  end
end