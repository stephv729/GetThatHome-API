# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'start destroying data ...'
Own.destroy_all
SavedProperty.destroy_all
PropertyForSale.destroy_all
PropertyForRent.destroy_all
Property.destroy_all
User.destroy_all
Role.destroy_all
PropertyType.destroy_all
puts 'end destroying data ...'

puts 'start creating roles'
role1 = Role.create(name: 'Homeseeker')
role2 = Role.create(name: 'Landlord')

puts role1.persisted?
puts role2.persisted?
puts 'end creating roles'

puts 'start creating users'
user1 = User.create(name: 'Pepito', role: role1, email: 'test@mail.com', password: '123456', phone: '+51932580181')
user2 = User.create(name: 'Juancito', role: role2, email: 'test1@mail.com', password: '123456', phone: '+555555')

puts user1.persisted?
puts user2.persisted?
puts 'end creating users'

puts 'start creating property types'
type1 = PropertyType.create(name: 'Aparment')
type2 = PropertyType.create(name: 'House')

puts type1.persisted?
puts type2.persisted?
puts 'end creating property types'

puts 'start creating addresses'
address1 = Address.create(latitude: 45.4, longitude: -34.2, name: 'direccion 1')
address2 = Address.create(latitude: 45.4, longitude: 160, name: 'direccion 2')

puts address1.persisted?
puts address2.persisted?
puts 'end creating addresses'

puts 'start creating properties'
url1 = 'https://images.freeimages.com/images/large-previews/e85/house-1224030.jpg'
url2 = 'https://media.istockphoto.com/photos/new-housing-estate-with-underground-garage-picture-id1287012612?s=612x612'
prop1 = Property.create(address: address1, property_type: type1, description: 'lovely place', area: '100',
                        photo_urls: [url1])
prop2 = Property.create(address: address1, property_type: type2, description: 'lovely place', area: '60',
                        photo_urls: [url1, url2])
prop3 = Property.create(address: address2, property_type: type2, description: 'lovely place', area: '80',
                        photo_urls: [url1, url2])

puts prop1.persisted?
puts prop2.persisted?
puts prop3.persisted?
puts 'end creating properties'

puts 'start creating properties for sale or rent'
rent1 = PropertyForRent.create(property: prop1, monthly_rent: 100, maintenance: 10, pets_allowed: true)
rent2 = PropertyForRent.create(property: prop2, monthly_rent: 200, maintenance: 20, pets_allowed: false)
sale1 = PropertyForSale.create(property: prop3, price: 300)

puts rent1.persisted?
puts rent2.persisted? ? 'true' : rent2.errors.full_messages
puts sale1.persisted?
puts 'end creating properties for sale or rent'

puts 'start creating saved properties'
favorite1 = SavedProperty.create(property: prop1, user: user1, favorite: true)
contacted1 = SavedProperty.create(property: prop2, user: user1, contacted: true)

puts favorite1.persisted?
puts contacted1.persisted?
puts 'end creating saved properties'

puts 'start creating own'
own1 = Own.create(user: user2, ownable: rent1)
own2 = Own.create(user: user2, ownable: rent2)
own3 = Own.create(user: user2, ownable: sale1)

puts own1.persisted?
puts own2.persisted?
puts own3.persisted?
puts 'end creating own'
