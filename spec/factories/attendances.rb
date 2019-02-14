FactoryBot.define do
  factory :attendance do
    stripe_customer_id { "tok_1234KHJDBQNS234JKHBDCD" }
    attendee { FactoryBot.create(:user) } 
    event { FactoryBot.create(:event) } 
  end
end
