# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#remise a zero des id dans toutes les tables
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end


#Create User
10.times do
  user = User.create!(first_name: Faker::DragonBall.character, last_name: Faker::Name.last_name , description: Faker::HowIMetYourMother.quote, email: Faker::Name.middle_name + "@yopmail.com")
end

#Create Event
5.times do
  event = Event.create!(title: Faker::Dessert.variety, description: Faker::ChuckNorris.fact, start_date: Faker::Date.between(Time.now, 1.week.from_now), duration: 5 * (1 + rand(60)), price: Faker::Number.between(1, 1000), location: Faker::Address.city, admin_id: User.all.ids.sample)
end

#Create Acceptance
15.times do
  attendance = Attendance.create!(stripe_customer_id: Faker::Invoice.creditor_reference, user_id: User.all.ids.sample, event_id: Event.all.ids.sample)
end

