# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

3.times do
  User.create!(
    email: "private_" + Faker::Internet.email,
    password: Faker::Internet.password,
    public: false
  )
end

#Test admin account
User.create!(email: "admin@example.com", password: "password")
#Auto-confirm admin
user = User.last
user.update_attribute(:confirmed_at, Time.now)
user.update_attribute(:admin, true)

User.create!(email: "member@example.com", password: "password")
User.last.update_attribute(:confirmed_at, Time.now)

# Make one user have a private profile
User.first.update_attribute(:public, false)

150.times do
  Item.create!(
    name: Faker::Lorem.sentence,
    user: User.all.sample
  )
end

Item.all.each do |item|
  item.update_attribute(:created_at, (rand*30 + 6).days.ago)
end

puts "#{User.count} users seeded."
puts "#{Item.count} items seeded."
