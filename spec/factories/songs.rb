FactoryGirl.define do
  factory :song do
    title { Faker::Movie.title}
    length 1
    genre { Faker::Food.title}
  end

end
