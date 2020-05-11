# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTagGossip.destroy_all
PrivateMessage.destroy_all

@city_anonymous = City.create(name: "SADC", zip_code: "33240")
@anonymous = User.create(first_name: "Anonyme", last_name: "Zorro", description: "Oui", email: "zorro@gmail.com", age: "18", city: @city_anonymous)

10.times do |index|
    city = City.create(name: Faker::Address.city, zip_code: Faker::Number.between(from: 10000, to: 99999))
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: "Descr #{index}", email: "email#{index}@gmail.com", age: Faker::Number.between(from: 15, to: 100), city: city)
end

5.times do |index|
    gossip = Gossip.create(title: "Gossip#{index}",content: "Coucou#{index}", user: User.all[Faker::Number.between(from: 1, to: 10)])
end

10.times do |index|
    tag = Tag.create(title: Faker::Job.key_skill )
    join_tag_gossip = JoinTagGossip.create(gossip: Gossip.all[Faker::Number.between(from: 1, to: 20)], tag: tag)
end

5.times do |index|
    private_message = PrivateMessage.create(content: "Coucou #{index}",sender: User.all[Faker::Number.between(from: 1, to: 10)], recipient1: User.all[Faker::Number.between(from: 1, to: 10)], recipient2: User.all[Faker::Number.between(from: 1, to: 10)] ) 
end