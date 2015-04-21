FactoryGirl.define do
  factory :playlist do
    title { Faker::Job.title}
    user_id {rand(1..User.all.size)}
  end
end
