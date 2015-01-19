# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..10).each do
  event = Event.new(name: Faker::Internet.slug)
  event.properties.new(key: Faker::Lorem.word, value: Faker::Lorem.word)
  event.save!
end