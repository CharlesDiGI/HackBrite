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

# User.delete_all
# Event.delete_all
# Attendance.delete_all
# EventSubmission.delete_all

#Create User
10.times do
  user = User.create!(first_name: Faker::DragonBall.character, last_name: Faker::Name.last_name , description: Faker::HowIMetYourMother.quote, email: Faker::Name.middle_name + "@yopmail.com", password: "tototo" )
puts "If you want to check user creation, email sent to: #{user.email}" 
end
puts "*" * 66

#Create un admin


#Create Event
15.times do
  event = Event.create!(title: "#{Faker::Military.marines_rank}  #{Faker::Esport.team}", description: Faker::ChuckNorris.fact, start_date: Faker::Date.forward(rand(1..30)), duration: 5 * (rand(1..360)), price: Faker::Number.between(1, 1000), location: Faker::Address.city, creator_id: User.all.ids.sample)
  event_submission = EventSubmission.create!(event_id: event.id, event_status_id: "1")
end

#Create Acceptance
8.times do
  attendance = Attendance.create!(stripe_customer_id: Faker::Invoice.creditor_reference, attendee_id: User.all.ids.sample, event_id: Event.all.ids.sample)
  puts "If you want to check the attendance, email sent to: #{attendance.event.creator.email}" 
end


