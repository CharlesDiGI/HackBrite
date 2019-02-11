FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(10) }
    description { Faker::ChuckNorris.fact }
    start_date { Faker::Date.between(Time.now, 1.week.from_now) }
    duration { (5 * (1 + rand(60))) }
    price { Faker::Number.between(1, 1000) }
    location { Faker::Address.city }
    admin_id { FactoryBot.create(:user).id }
    attendee_id { FactoryBot.create(:user).id }
  end
end
