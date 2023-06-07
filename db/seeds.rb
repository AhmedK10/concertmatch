# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples#:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "deleting all old data....."
User.destroy_all
Concert.destroy_all
Favorite.destroy_all
Forum.destroy_all
Comment.destroy_all

# #USERS:
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
  email: "alex@gmail.com",
  password: 'secret',
  first_name: "Alex",
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

15.times do
  first_name = Faker::Name.unique.female_first_name
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

15.times do
  first_name = Faker::Name.unique.male_first_name
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

15.times do
  unique_id = SecureRandom.hex(4) # Generate a unique identifier
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.last_name

  User.create!(
    email: "#{first_name.downcase}#{unique_id}@gmail.com",
    password: 'secret',
    first_name: first_name,
    last_name: last_name,
    gender: 2,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 75)
  )
end

#CONCERTS:
puts 'Fetching Concerts from TicketMaster....'
events_raw = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?size=100&apikey=#{ENV["TICKETMASTERKEY"]}")
#events_raw_ams = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?city=Amsterdam&size=1&apikey=#{ENV["TICKETMASTERKEY"]}")
puts events_raw
events = events_raw["_embedded"]["events"]

events.each do |event|
  Concert.create!(
    name: event["name"],
    address: event["_embedded"]["venues"][0]["address"]["line1"],
    summary: "#{event["name"]}: a concert by #{event["_embedded"]["attractions"][0]["name"]}",
    date: event["dates"]["start"]["dateTime"],
    artist: event["_embedded"]["attractions"][0]["name"],
    genre: event["classifications"][0]["genre"]["name"]
    )
end

puts "Creating Fromus and comments"

concerts = Concert.all
users = User.all

concerts.each do |concert|
  num_forums = rand(3..5)

  num_forums.times do
    user = users.sample
    # forum_type = Forum.types.keys.sample

    Forum.create!(
      # type: forum_type,
      content: Faker::Lorem.paragraph(sentence_count: 3),
      user: user,
      concert: concert
    )

    # num_comments = rand(2..5)
    # num_comments.time do
    #   Comment.create!(
    #     content: Faker::Lorem.sentence,
    #     forum: forum,
    #     user: user
    #   )
    # end
  end
end
