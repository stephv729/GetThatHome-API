# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Own.destroy_all
PropertyUser.destroy_all
PropertyForSale.destroy_all
PropertyForRent.destroy_all
Property.destroy_all
User.destroy_all
Role.destroy_all
PropertyType.destroy_all

role1 = Role.create(name:"Homeseeker")
role2 = Role.create(name:"Landlord")
User.create(name:"Pepito", role: role1)
User.create(name:"Juancito", role: role2)

type1 = PropertyType.create(name:"Aparment")
type2 = PropertyType.create(name:"House")

address = Address.create(latitude: 45.4, longitude:-34.2)
address2 = Address.create(latitude: 45.4, longitude:160)
prop1 = Property.create(address: address, property_type: type1)
prop2 = Property.create(address: address, property_type: type2)
prop3 = Property.create(address: address2, property_type: type2)
rent1 = PropertyForRent.create(property:prop1,monthly_rent: 200, maintenance: 20, pets_allowed: true)