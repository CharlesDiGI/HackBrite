FactoryBot.define do
  factory :event do
    title { Faker::Military.marines_rank }
    description { Faker::ChuckNorris.fact }
    start_date { Faker::Date.forward(15) }
    duration { 5 * (rand(1..360)) }
    price { Faker::Number.between(1, 1000) }
    location { Faker::Address.city }
    admin { FactoryBot.create(:user) }
  end
end
