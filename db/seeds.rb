# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..3).each do
  user = User.new(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
  user.save
end

(1..30).each do
  user = User.find(rand(1..3))
  event = user.events.new(name: Faker::Internet.slug)
  event.properties.new(key: Faker::Lorem.word, value: Faker::Lorem.word)
  event.save!
end