# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'json'
require 'open-uri'

puts "deleting all old data....."
User.destroy_all
Concert.destroy_all
Favorite.destroy_all
Artist.destroy_all
Performance.destroy_all
Forum.destroy_all
Comment.destroy_all

#USERS:
puts 'Creating Users....'
User.create!(
  email: "ben@gmail.com",
  password: 'secret',
  first_name: "Ben",
  last_name: "Lee",
  gender: 0,
  date_of_birth: Date.parse("1999-01-08")
)

User.create!(
  email: "emma@gmail.com",
  password: 'secret',
  first_name: "Emma",
  last_name: "Smith",
  gender: 1,
  date_of_birth: Date.parse("1997-04-04")
)

User.create!(
  email: "max@gmail.com",
  password: 'secret',
  first_name: "Max",
  last_name: "Hill",
  gender: 0,
  date_of_birth: Date.parse("2001-03-03")
)

User.create!(
  email: "ben@gmail.com",
  password: 'secret',
  first_name: "Ben",
  last_name: "Scott",
  gender: 1,
  date_of_birth: Date.parse("1985-12-07")
)

User.create!(
  email: "leo@gmail.com",
  password: 'secret',
  first_name: "Leo",
  last_name: "Reed",
  gender: 2,
  date_of_birth: Date.parse("1975-11-13")
)

50.times do
  first_name = Faker::Name.female_first_name
  last_name = Faker::Name.last_name

  User.create!(
    email: "#{first_name.downcase}@gmail.com",
    password: 'secret',
    first_name: first_name,
    last_name: last_name,
    gender: 1,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 75)
  )
end

50.times do
  first_name = Faker::Name.male_first_name
  last_name = Faker::Name.last_name

  User.create!(
    email: "#{first_name.downcase}@gmail.com",
    password: 'secret',
    first_name: first_name,
    last_name: last_name,
    gender: 0,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 75)
  )
end

50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create!(
    email: "#{first_name.downcase}@gmail.com",
    password: 'secret',
    first_name: first_name,
    last_name: last_name,
    gender: 2,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 75)
  )
end

#USERS:
