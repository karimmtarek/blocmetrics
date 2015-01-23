# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event_name = %w(page-view click-click page-exit)

(1..3).each do |n|
  user = User.new(email: "user#{n}@gmail.com", password: 'password', password_confirmation: 'password')
  user.domains.new(url: "user#{n}.com")
  user.save
end

(1..3000).each do
  user = User.find(rand(1..3))
  event = user.events.new(name: event_name[rand(0..2)], created_on: Faker::Date.between(30.days.ago, Date.today))
  event.source_url = user.domains.first.url
  event.properties.new(key: Faker::Lorem.word, value: Faker::Lorem.word)
  event.save!
end