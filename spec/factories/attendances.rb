FactoryBot.define do
  factory :attendance do
    stripe_customer_id { Faker::Invoice.creditor_reference }
    user_id { FactoryBot.create(:user).id } 
    event_id { FactoryBot.create(:event).id } 
  end
end
