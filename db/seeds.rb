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



wyatt = Pet.create(name: "Wyatt", care: "1.5 cups twice a day", household_id: tibbetts.id, owner_id: mike.id)
penny = Pet.create(name: "Penelope", care: "1.5 cups twice a day", household_id: stanford.id, owner_id: frank.id)
willy = Pet.create(name: "Willy", care: "1.5 cups twice a day", household_id: stanford.id, owner_id: brian.id)


Event.create(pet_id: wyatt.id, user_id: frank.id, event_type: "Fed", details: "2 cups")
Event.create(pet_id: penny.id, user_id: frank.id, event_type: "Fed", details: "2 cups")
Event.create(pet_id: willy.id, user_id: frank.id, event_type: "Fed", details: "2 cups")
Event.create(pet_id: wyatt.id, user_id: frank.id, event_type: "Walked", details: "2 miles")
Event.create(pet_id: penny.id, user_id: frank.id, event_type: "Walked", details: "2 miles")
Event.create(pet_id: willy.id, user_id: frank.id, event_type: "Walked", details: "2 miles")

UserHousehold.create(user_id: frank.id, household_id: tibbetts.id)
UserHousehold.create(user_id: frank.id, household_id: stanford.id)
UserHousehold.create(user_id: mike.id, household_id: tibbetts.id)
UserHousehold.create(user_id: wendy.id, household_id: stanford.id)
UserHousehold.create(user_id: brian.id, household_id: stanford.id)

CareReminder.create(pet_id: penny.id, care_type: "heartworm", details: "one heatworm every month", date: "Wed Jun 03 2020 09:33:16 GMT-0700 (Pacific Daylight Time)")
CareReminder.create(pet_id: wyatt.id, care_type: "heartworm", details: "one heatworm every month", date: "Wed Jun 03 2020 09:33:16 GMT-0700 (Pacific Daylight Time)")
CareReminder.create(pet_id: willy.id, care_type: "heartworm", details: "one heatworm every month", date: "Wed Jun 03 2020 09:33:16 GMT-0700 (Pacific Daylight Time)")

