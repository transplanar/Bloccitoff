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

#Test admin account
User.create!(email: "admin@example.com", password: "password")
#Auto-confirm admin
user = User.last
user.update_attribute(:confirmed_at, Time.now)

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
