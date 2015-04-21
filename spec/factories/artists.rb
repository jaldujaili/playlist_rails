FactoryGirl.define do
  factory :artist do
    name { Faker::Name.name }
    playlist_id { rand(1..Playlist.all.size)}
  end

end
