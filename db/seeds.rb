require "faker"

puts "start destroying data ..."
Own.destroy_all
SavedProperty.destroy_all
PropertyForSale.destroy_all
PropertyForRent.destroy_all
Property.destroy_all
User.destroy_all
Role.destroy_all
PropertyType.destroy_all
Address.destroy_all
puts "end destroying data ..."

# Roles
puts "start creating roles"
roles = [
  {
    name: "Homeseeker"
  }, {
    name: "Landlord"
  }
]

roles.each do |role_data|
  role = Role.create(role_data)
  unless role.persisted?
    puts role.errors.full_messages
    puts role
  end
end
puts "end creating roles"

# Users
puts "start creating users"
roles = Role.all.to_a
5.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.safe_email,
    role: roles.sample,
    password: "123456",
    phone: Faker::PhoneNumber.unique.cell_phone_in_e164
  )
  unless user.persisted?
    puts user.errors.full_messages
    puts user
  end
end
puts "end creating users"

# Property Types
puts "start creating property types"
types = [
  {
    name: "Apartment"
  }, {
    name: "House"
  }
]

types.each do |type_data|
  type = PropertyType.create(type_data)
  unless type.persisted?
    puts type.errors.full_messages
    puts type
  end
end
puts "end creating property types"

# Addresses
puts "start creating addresses"
20.times do
  address = Address.create(
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    name: Faker::Address.community
  )
  unless address.persisted?
    puts address.errors.full_messages
    puts address
  end
end
puts "end creating addresses"

# Properties
puts "start creating properties"
urls = ["https://images.freeimages.com/images/large-previews/e85/house-1224030.jpg",
        "https://media.istockphoto.com/photos/new-housing-estate-with-underground-garage-picture-id1287012612?s=612x612", "https://images.freeimages.com/images/large-previews/d5b/home-1224274.jpg", "https://images.freeimages.com/images/large-previews/4b4/beach-house-1225387.jpg"]

addresses = Address.all.to_a
types = PropertyType.all.to_a
20.times do
  property = Property.create(
    address: addresses.sample,
    property_type: types.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 150, supplemental: false),
    area: rand(50..200)*10,
    bedrooms: rand(1...10),
    bathrooms: rand(1...5),
    photo_urls: urls.sample(rand(1...urls.length))
  )
  unless property.persisted?
    puts property.errors.full_messages
    puts property
  end
end
puts "end creating properties"

# Properties For Rent or Sale
puts "start creating properties for sale or rent"
properties = Property.all.to_a
rent_group_length = rand(1...properties.length)
rent_group = properties.sample(rent_group_length)
sale_group = properties - rent_group

rent_group.each do |property|
  rent = PropertyForRent.create(
    property:,
    monthly_rent: rand(8...30) * 100,
    maintenance: rand(1...12) * 20,
    pets_allowed: [true, false].sample
  )
  unless rent.persisted?
    puts rent.errors.full_messages
    puts rent
  end
end

sale_group.each do |property|
  sale = PropertyForSale.create(
    property:,
    price: rand(8...30) * 100
  )
  unless sale.persisted?
    puts sale.errors.full_messages
    puts sale
  end
end
Rails.logger.debug "end creating properties for sale or rent"

# Saved Properties
Rails.logger.debug "start creating saved properties"

properties_to_save = properties.sample(rand(1...properties.length))
homeseekers = User.where(role: Role.find_by(name: "Homeseeker"))

properties_to_save.each do |property|
  saved_property = SavedProperty.create(
    property:,
    user: homeseekers.sample,
    favorite: [true, false].sample,
    contacted: [true, false].sample
  )

  unless saved_property.persisted?
    puts saved_property.errors.full_messages
    puts saved_property
  end
end
puts "end creating saved properties"

# Ownable properties
puts "start creating own"
landlords = User.where(role: Role.find_by(name: "Landlord")).to_a
properties_to_own = PropertyForSale.all.to_a + PropertyForRent.all.to_a

properties_to_own.each do |property|
  ownable_property = Own.create(
    ownable: property,
    user: landlords.sample
  )

  unless ownable_property.persisted?
    puts ownable_property.errors.full_messages
    puts ownable_property
  end
end
puts "end creating own"
