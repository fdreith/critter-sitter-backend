# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

frank = User.create(first_name: "Francesca", last_name: "Dreith", email: "f@f.com", password: "password")
mike = User.create(first_name: "Mike", last_name: "Alexander", email: "a@a.com", password: "password")
wendy = User.create(first_name: "Wendy", last_name: "Boyd", email: "w@w.com", password: "password")
brian = User.create(first_name: "Brian", last_name: "Dreith", email: "b@b.com",password: "password")

tibbetts = Household.create(name: "Tibbetts", address: "123 Tibbetts St", owner_id: frank.id, password: "password")
stanford = Household.create(name: "Stanford", address: "123 Stanford St",owner_id: brian.id, password: "password")

UserHousehold.create(user_id: frank.id, household_id: tibbetts.id)
UserHousehold.create(user_id: frank.id, household_id: stanford.id)
UserHousehold.create(user_id: mike.id, household_id: tibbetts.id)
UserHousehold.create(user_id: wendy.id, household_id: stanford.id)
UserHousehold.create(user_id: brian.id, household_id: stanford.id)

wyatt = Pet.create(name: "Wyatt", care_instructions: "1.5 cups twice a day", household_id: tibbetts.id, owner_id: mike.id)
penny = Pet.create(name: "Penelope", care_instructions: "1.5 cups twice a day", household_id: stanford.id, owner_id: frank.id)
willy = Pet.create(name: "Willy", care_instructions: "1.5 cups twice a day", household_id: stanford.id, owner_id: brian.id)

Event.create(event_type: 0, name: "Fed", details: "2 cups", pet_id: wyatt.id, user_id: frank.id)
Event.create(event_type: 0, name: "Fed", details: "2 cups", pet_id: penny.id, user_id: frank.id)
Event.create(event_type: 0, name: "Fed", details: "2 cups", pet_id: penny.id, user_id: frank.id)
Event.create(event_type: 0, name: "Walked", details: "2 miles", pet_id: willy.id, user_id: frank.id)
Event.create(event_type: 0, name: "Walked", details: "2 miles", pet_id: wyatt.id, user_id: frank.id)
Event.create(event_type: 0, name: "Walked", details: "2 miles", pet_id: penny.id, user_id: frank.id)
Event.create(event_type: 0, name: "Walked", details: "2 miles", pet_id: willy.id, user_id: frank.id)

Event.create(event_type: 1, name: "heartworm", details: "one heatworm every month", pet_id: penny.id, user_id: frank.id, date: DateTime.new(2021,1,1,3.5))
Event.create(event_type: 1, name: "heartworm", details: "one heatworm every month", pet_id: wyatt.id, user_id: mike.id, date: DateTime.new(2021,1,1,3.5))
Event.create(event_type: 1, name: "heartworm", details: "one heatworm every month", pet_id: willy.id, user_id: wendy.id, date: DateTime.new(2021,1,1,3.5))

