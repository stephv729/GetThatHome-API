require "faker"

Rails.logger.debug "start destroying data ..."
Own.destroy_all
SavedProperty.destroy_all
PropertyForSale.destroy_all
PropertyForRent.destroy_all
Property.destroy_all
User.destroy_all
Role.destroy_all
PropertyType.destroy_all
Rails.logger.debug "end destroying data ..."

# Roles
Rails.logger.debug "start creating roles"
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
    Rails.logger.debug role.errors.full_messages
    Rails.logger.debug role
  end
end
Rails.logger.debug "end creating roles"

# Users
Rails.logger.debug "start creating users"
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
    Rails.logger.debug user.errors.full_messages
    Rails.logger.debug user
  end
end
Rails.logger.debug "end creating users"

# Property Types
Rails.logger.debug "start creating property types"
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
    Rails.logger.debug type.errors.full_messages
    Rails.logger.debug type
  end
end
Rails.logger.debug "end creating property types"

# Addresses
Rails.logger.debug "start creating addresses"
20.times do
  address = Address.create(
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    name: Faker::Address.community
  )
  unless address.persisted?
    Rails.logger.debug address.errors.full_messages
    Rails.logger.debug address
  end
end
Rails.logger.debug "end creating addresses"

# Properties
Rails.logger.debug "start creating properties"
urls = ["https://images.freeimages.com/images/large-previews/e85/house-1224030.jpg",
        "https://media.istockphoto.com/photos/new-housing-estate-with-underground-garage-picture-id1287012612?s=612x612", "https://images.freeimages.com/images/large-previews/d5b/home-1224274.jpg", "https://images.freeimages.com/images/large-previews/4b4/beach-house-1225387.jpg"]

addresses = Address.all.to_a
types = PropertyType.all.to_a
20.times do
  property = Property.create(
    address: addresses.sample,
    property_type: types.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 150, supplemental: false),
    area: rand(500..2000),
    photo_urls: urls.sample(rand(1...urls.length))
  )
  unless property.persisted?
    Rails.logger.debug property.errors.full_messages
    Rails.logger.debug property
  end
end
Rails.logger.debug "end creating properties"

# Properties For Rent or Sale
Rails.logger.debug "start creating properties for sale or rent"
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
    Rails.logger.debug rent.errors.full_messages
    Rails.logger.debug rent
  end
end

sale_group.each do |property|
  sale = PropertyForSale.create(
    property:,
    price: rand(8...30) * 100
  )
  unless sale.persisted?
    Rails.logger.debug sale.errors.full_messages
    Rails.logger.debug sale
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
    Rails.logger.debug saved_property.errors.full_messages
    Rails.logger.debug saved_property
  end
end
Rails.logger.debug "end creating saved properties"

# Ownable properties
Rails.logger.debug "start creating own"
landlords = User.where(role: Role.find_by(name: "Landlord")).to_a
properties_to_own = PropertyForSale.all.to_a + PropertyForRent.all.to_a

properties_to_own.each do |property|
  ownable_property = Own.create(
    ownable: property,
    user: landlords.sample
  )

  unless ownable_property.persisted?
    Rails.logger.debug ownable_property.errors.full_messages
    Rails.logger.debug ownable_property
  end
end
Rails.logger.debug "end creating own"
