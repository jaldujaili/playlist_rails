FactoryGirl.define do
  factory :song do
    title { Faker::Movie.title}
    length 1
    genre { Faker::Food.ingredient}
    # playlist_id {rand(1..Playlist.all.size)}
    artist_id {rand(1..Artist.all.size)}
    album_id {rand(1..Album.all.size)}
  end
end
