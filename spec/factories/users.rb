FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name }
    description { Faker::HowIMetYourMother.quote }
    email { "#{first_name}@yopmail.com" } 
  end
end
