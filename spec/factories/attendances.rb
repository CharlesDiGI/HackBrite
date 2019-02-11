FactoryBot.define do
  factory :attendance do
    association :user, factory: :user
    association :event, factory: :event
    stripe_customer_id { "VDNjndn;dnlknd89lfkn"}
    
  end
end
