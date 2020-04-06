# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "seeding"

Message.destroy_all
User.destroy_all
Channel.destroy_all

general = Channel.create!(name: "general")
paris = Channel.create!(name: "paris")
react = Channel.create!(name: "react")

10.times do
  channels = [general, paris, react]
  random = channels.sample
  ghost_character = Faker::Movies::Ghostbusters.character
  email = Faker::Internet.email(name: ghost_character, domain: "ghostbuster")
  user = User.create!(email: email, password: "123456")
  5.times do
    content = Faker::Movies::Ghostbusters.quote
    message = Message.create!(user: user , channel: random , content: content)
  end

end


java = User.create!(email: "java@react.com" , password: "123456")

message = Message.create!(user: java , channel: general , content: "I made it!")

puts "Seeding done!"
