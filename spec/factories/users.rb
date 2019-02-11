FactoryBot.define do
  factory :user do
    first_name { Faker::DragonBall.character }
    last_name { Faker::Name.last_name }
    description { Faker::HowIMetYourMother.quote }
    email { first_name + "@yopmail.com" }   
  end
end
