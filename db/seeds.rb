# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples#:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require 'json'
require 'httparty'

puts "deleting all old data....."
User.destroy_all
# Concert.destroy_all
Favorite.destroy_all
# Forum.destroy_all
# Comment.destroy_all

# #USERS:
bio_options = [
  "Passionate musician spreading good vibes through my music.",
  "Concert-goer and music enthusiast always searching for the next great show.",
  "Rocking the stage and connecting with the crowd through my music.",
  "Dedicated fan of live music and unforgettable concert experiences.",
  "Music lover on a mission to discover new sounds and rhythms.",
  "Melody-driven soul seeking the magic of live performances.",
  "Concert junkie always chasing the adrenaline of a live show.",
  "Guitarist with a passion for creating and performing original music.",
  "Harmony architect, blending different musical elements to create unique sonic landscapes.",
  "Music connoisseur, curating playlists that take listeners on unforgettable musical journeys.",
  "Drummer keeping the beat and driving the energy of the live performance.",
  "Electrifying performer igniting the stage with my musical prowess.",
  "Captivating audiences with the power of my voice and heartfelt lyrics.",
  "Groove seeker, constantly exploring the rhythmic wonders of different genres.",
  "Songwriter crafting melodies that resonate with the depths of the human experience.",
  "Unplugged troubadour, sharing intimate acoustic moments with audiences.",
  "Keyboard magician, weaving enchanting melodies that transport listeners to otherworldly realms.",
  "Vocal powerhouse, belting out soul-stirring tunes that leave audiences in awe.",
  "Bassline aficionado, providing the foundation for the band's infectious groove.",
  "Genre explorer, pushing boundaries and fusing different styles to create a fresh musical fusion.",
  "Lyric poet, crafting heartfelt words that touch the hearts and minds of listeners.",
  "Stage presence extraordinaire, commanding attention with every note and movement.",
  "Concert advocate, promoting the importance of live music for the soul and community.",
  "Multi-instrumentalist, mastering various instruments to create a symphony of sounds.",
  "Music therapist, using the power of music to heal and uplift spirits.",
  "Choir member, harmonizing with others to create a celestial vocal blend.",
  "Music producer, shaping and molding sounds to create a sonic masterpiece."
] 

puts "Creating Users...."

ben = User.new(
  email: "ben@gmail.com",
  password: "secret",
  first_name: "Ben",
  last_name: "Lee",
  gender: 0,
  date_of_birth: Date.parse("1989-01-08"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/male/49.jpg")
ben.photo.attach(io: file, filename: "#{ben.first_name}.jpg", content_type: "image/jpeg")
ben.save


sofia = User.new(
  email: "sofia@gmail.com",
  password: "secret",
  first_name: "Sofia",
  last_name: "Neille",
  gender: 1,
  date_of_birth: Date.parse("1983-02-09"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/female/44.jpg")
sofia.photo.attach(io: file, filename: "#{sofia.first_name}.jpg", content_type: "image/jpeg")
sofia.save


karena = User.new(
  email: "karena@gmail.com",
  password: "secret",
  first_name: "Karena",
  last_name: "Radican",
  gender: 1,
  date_of_birth: Date.parse("1999-03-09"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/female/55.jpg")
karena.photo.attach(io: file, filename: "#{karena.first_name}.jpg", content_type: "image/jpeg")
karena.save


pura = User.new(
  email: "pura@gmail.com",
  password: "secret",
  first_name: "Pura",
  last_name: "Greven",
  gender: 1,
  date_of_birth: Date.parse("2003-04-02"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/female/20.jpg")
karena.photo.attach(io: file, filename: "#{karena.first_name}.jpg", content_type: "image/jpeg")
pura.save


emma = User.new(
  email: "emma@gmail.com",
  password: "secret",
  first_name: "Emma",
  last_name: "Smith",
  gender: 1,
  date_of_birth: Date.parse("1991-04-04"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/female/25.jpg")
emma.photo.attach(io: file, filename: "#{emma.first_name}.jpg", content_type: "image/jpeg")
emma.save


dirk = User.new(
  email: "dirk@gmail.com",
  password: "secret",
  first_name: "Dirk",
  last_name: "Buns",
  gender: 0,
  date_of_birth: Date.parse("1982-07-03"),
  bio: bio_options.sample  
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/male/77.jpg")
dirk.photo.attach(io: file, filename: "#{dirk.first_name}.jpg", content_type: "image/jpeg")
dirk.save


max = User.new(
  email: "max@gmail.com",
  password: "secret",
  first_name: "Max",
  last_name: "Hill",
  gender: 0,
  date_of_birth: Date.parse("2002-03-03"),
  bio: bio_options.sample  
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/male/77.jpg")
max.photo.attach(io: file, filename: "#{max.first_name}.jpg", content_type: "image/jpeg")
max.save


alex = User.new(
  email: "alex@gmail.com",
  password: "secret",
  first_name: "Alex",
  last_name: "Scott",
  gender: 1,
  date_of_birth: Date.parse("1977-12-07"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/male/45.jpg")
alex.photo.attach(io: file, filename: "#{alex.first_name}.jpg", content_type: "image/jpeg")
alex.save


leo = User.new(
  email: "leo@gmail.com",
  password: "secret",
  first_name: "Leo",
  last_name: "Reed",
  gender: 2,
  date_of_birth: Date.parse("1975-11-13"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/male/78.jpg")
leo.photo.attach(io: file, filename: "#{alex.first_name}.jpg", content_type: "image/jpeg")
leo.save



elena = User.new(
  email: "elena@gmail.com",
  password: "secret",
  first_name: "Elena",
  last_name: "Quartes",
  gender: 1,
  date_of_birth: Date.parse("1987-08-05"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/female/64.jpg")
elena.photo.attach(io: file, filename: "#{elena.first_name}.jpg", content_type: "image/jpeg")
elena.save


sasha = User.new(
  email: "sasha@gmail.com",
  password: "secret",
  first_name: "Sasha",
  last_name: "Olshan",
  gender: 1,
  date_of_birth: Date.parse("1987-08-05"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/female/2.jpg")
sasha.photo.attach(io: file, filename: "#{sasha.first_name}.jpg", content_type: "image/jpeg")
sasha.save


delbert = User.new(
  email: "delbert@gmail.com",
  password: "secret",
  first_name: "Delbert",
  last_name: "Kewley",
  gender: 1,
  date_of_birth: Date.parse("1995-12-07"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/male/56.jpg")
delbert.photo.attach(io: file, filename: "#{delbert.first_name}.jpg", content_type: "image/jpeg")
delbert.save


lewana = User.new(
  email: "lawana@gmail.com",
  password: "secret",
  first_name: "Lewana",
  last_name: "Armey",
  gender: 1,
  date_of_birth: Date.parse("1996-01-02"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/female/61.jpg")
lewana.photo.attach(io: file, filename: "#{lewana.first_name}.jpg", content_type: "image/jpeg")
lewana.save


milton = User.new(
  email: "milton@gmail.com",
  password: "secret",
  first_name: "Milton",
  last_name: "Borch",
  gender: 1,
  date_of_birth: Date.parse("1996-01-02"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/male/25.jpg")
milton.photo.attach(io: file, filename: "#{milton.first_name}.jpg", content_type: "image/jpeg")
milton.save


lane = User.new(
  email: "lane@gmail.com",
  password: "secret",
  first_name: "Lane",
  last_name: "Walmer",
  gender: 0,
  date_of_birth: Date.parse("1995-10-02"),
  bio: bio_options.sample 
)
file = URI.open("https://xsgames.co/randomusers/assets/avatars/female/29.jpg")
lane.photo.attach(io: file, filename: "#{lane.first_name}.jpg", content_type: "image/jpeg")
lane.save 

Concert.where(date: nil).destroy_all

puts "Creating Fromus and comments"

rand_posts = ["You seem like a great person to share an apartment or room with for the concert!",
  "I love your enthusiasm for finding a concert buddy. It's contagious!",
  "You're going to have an amazing time at the concert, especially with the right roommate!",
  "Your positive energy makes you the perfect roommate for a concert adventure.",
  "Finding someone as excited as you to share a place for the concert will make the experience even better!",
  "You'll create incredible memories with your concert companion in the apartment or room you find.",
  "I have a feeling you'll meet an incredible roommate who shares your love for music and adventure.",
  "The concert is going to be unforgettable, especially when you find the right person to experience it with.",
  "Your passion for music will attract someone equally passionate to be your roommate during the concert.",
  "I can imagine the fun conversations and laughter you'll share with your apartment mate.",
  "The anticipation of finding a concert buddy is just as exciting as the concert itself.",
  "Your search for a roommate is like embarking on a thrilling quest leading up to the concert day.",
  "It's inspiring to see your dedication in finding the perfect companion for this concert journey.",
  "The stories and adventures you'll have with your concert roommate will make this experience unforgettable.",
  "Your genuine desire to connect with someone for the concert shows what a kind-hearted person you are.",
  "The bond you'll form with your roommate while attending the concert will last a lifetime.",
  "I can't wait to hear about the incredible memories you'll create with your concert roommate.",
  "The joy and excitement you bring to the search for a roommate make me confident you'll find an amazing match.",
  "You're on the right track to find a like-minded concert buddy. Keep up the positive energy!",
  "The concert will be even more special with the shared experience of finding a great roommate. Good luck!"]
  
  concerts = Concert.all
  users = User.all
  
  concerts.each do |concert|
    num_forums = 20
    
    num_forums.times do
      user = users.sample
      # forum_type = Forum.types.keys.sample
      
      Forum.create(
        board: [0, 1, 2].sample,
        content: rand_posts.sample,
        user: user,
        concert: concert,
      )
    end
    
    puts "Creating Favorites...."
    20.times do
      user = User.all.sample
      concert = Concert.all.sample
      Favorite.create!(user: user, concert: concert)
    end
    
    # num_comments = rand(2..5)
    # num_comments.time do
    #   Comment.create!(
    #     content: Faker::Lorem.sentence,
    #     forum: forum,
    #     user: user
    #   )
    # end
  end
  
  
