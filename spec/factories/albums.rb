FactoryGirl.define do
  factory :album do
    title { Faker::Color.name}
    playlist_id { rand(1..Playlist.all.size)}
    artist_id { rand(1..Artist.all.size)}
  end

end
