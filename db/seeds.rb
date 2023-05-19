# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'cleaning database...'
Booking.destroy_all
Review.destroy_all
Room.destroy_all
User.destroy_all

new_user = User.create(username: 'joe', email: 'joe@email.com', password: 'password', password_confirmation: 'password')
new_user1 = User.create(username: 'mathieu', email: 'mathieu@email.com', password: 'password', password_confirmation: 'password')
new_user2 = User.create(username: 'tedjenkins', email: 'ted@email.com', password: 'password', password_confirmation: 'password')
new_user4 = User.create(username: 'maskedthief', email: 'maskedthief@email.com', password: 'password', password_confirmation: 'password')
User.create(username: 'rashon', email: 'rashon@email.com', password: 'password', password_confirmation: 'password')
new_user3 = User.create(username: 'Kayla', email: 'kayla@email.com', password: 'password', password_confirmation: 'password')

new_room = Room.new(
  name: 'Manequins',
  address: 'Ginza, Tokyo 170-0002',
  story: 'In the heart of bustling Tokyo, there stood a remarkable refuge called "Shinsetsu Break Room." Nestled amidst
  the towering skyscrapers,
  it offered a sanctuary for those burdened by the weight of toxic coworkers and unrelenting workplace stress. You can break the mannequins as you wish.
  You can also bring your own manequins.',
  description: 'This room is filled with 300 customizeable manequins.',
  capacity: 2,
  price: 9000
)

new_room1 = Room.new(
  name: 'Warehouse',
  address: 'Shibuya, Tokyo 150-0002',
  story: 'This room  was an old warehouse that was converted into a break room. It is located in the heart of the city.
  A lot of people died here because of the toxic fumes. The previous owner was never found.',
  description: 'This room contains a lot of old furniture. You can break them as you wish. You can also bring your own
   furniture',
  capacity: 2,
  price: 5000
)

new_room2 = Room.new(
  name: "My ex-boyfriend's apartment. Fuck you Charlie",
  address: 'Chiyoda, Tokyo 100-0005',
  story: 'Destroy all the expensive in this appartment. Destroy the cheap stuff too. You can also bring
  your own expensive stuff. All I ask is that you let me watch and maybe bring some wine.',
  description: "Caught my bf cheating on me. Go crazy on his nice apartment.",
  capacity: 2,
  price: 1000
)

new_room3 = Room.new(
  name: 'Arcade junk',
  address: 'Shinjuku, Tokyo 160-0023',
  story: "The only gamers here now are ghosts. There are many tools at your disposal. Use bats, hammers, your fists, whatever is laying around!",
  description: "A defunct Game center",
  capacity: 2,
  price: 5000
)

new_room4 = Room.new(
  name: 'Apple Store',
  address: 'Minato, Tokyo 105-6333',
  story: "Can't afford Apple's expensive stuff? Bought an iPad that's end-of-life a year after release? Come here and destroy everything.
  All the devices are functional. Please try them before!",
  description: "Apple Devices are planned obsolescence. Let's make their store obsolete too.",
  capacity: 2,
  price: 7000
)

new_room5 = Room.new(
  name: 'Japanese pottery',
  address: 'Taito, Kyoto 110-0005',
  story: 'This room is filled with fragile japanese pottery, painstakingly hand-crafted by Hiro Nakamura and displayed at
  the Tokyo museum of pottery. Come here to destroy everything and awake you soul.',
  description: "Containing Pottery crafted by the legendary Hiro Nakamura",
  capacity: 2,
  price: 7000
)


# Adding some new rooms here

new_room6 = Room.new(
  name: "Ted Jenkins' Uptown Flat",
  address: '18-2, Kyobashi 2-chome, Tokyo',
  story: "I spent a lot of money on this flat so I could invite friends over, and noone wants to hang out with me, so its going to waste. If you're down we can watch some movies and have pizza first! Please hang out with me.",
  description: "Small flat with big potential",
  capacity: 4,
  price: 2000
)

new_room7 = Room.new(
  name: "Jewelry Shop",
  address: '244-1270, Yunohana, Fukushima',
  story: "Tried to buy an engagement ring from here but it was too expensive. Let's liberate all their rings from them",
  description: "Shiny, expensive, and read to be destroyed",
  capacity: 5,
  price: 12000
)

# new_room8 = Room.new(
#   name: "Jewelry Shop",
#   address: '244-1270, Yunohana, Fukushima',
#   story: "Tried to buy an engagement ring from here but it was too expensive. Let's liberate all their rings from them",
#   description: "Shiny, expensive, and read to be destroyed",
#   capacity: 5,
#   price: 7000
# )

new_room.user = new_user  # the owner is Joe
new_room1.user = new_user # the owner is Joe
new_room2.user = new_user3 # the owner is Kayla
new_room3.user = new_user # the owner is Joe
new_room4.user = new_user # the owner is Joe
new_room5.user = new_user1 # the owner is Mathieu
new_room6.user = new_user2 # the owner is Ted
new_room7.user = new_user4 # the owner is a masked thief

new_room.save
new_room1.save
new_room2.save
new_room3.save
new_room4.save
new_room5.save
new_room6.save
new_room7.save

new_booking = Booking.new(
  date: Date.today,
  number_of_people: 2,
  status: :requested
)
new_booking.user = new_user1 # the guest is Mathieu
new_booking.room = new_room
new_booking.save

new_room.photo.attach(
  filename: 'Mexico-Mannequin',
  io: URI.open('https://res.cloudinary.com/dfv1szuzs/image/upload/v1684292577/Mexico-Mannequin-Plus-Size-Mannequin-with-Matt-Black-or-White-Color_i3itob.webp')
)

new_room1.photo.attach(
  filename: 'warehouse-break-room.jpg',
  io: URI.open('https://res.cloudinary.com/dfv1szuzs/image/upload/v1684293493/photo-1473023914974-0d98f0798b51_pzolsv.jpg')
)

new_room2.photo.attach(
  filename: 'fancy-appartment.jpg',
  io: URI.open('https://res.cloudinary.com/dfv1szuzs/image/upload/v1684293506/photo-1512914890251-2f96a9b0bbe2_tzqnkt.jpg')
)

new_room3.photo.attach(
  filename: 'arcade.jpg',
  io: URI.open('https://res.cloudinary.com/dfv1szuzs/image/upload/v1684293467/photo-1553640627-57a6de3bf0ff_lxrhp5.jpg')
)

new_room4.photo.attach(
  filename: 'apple-store.jpg',
  io: URI.open('https://res.cloudinary.com/dfv1szuzs/image/upload/v1684293521/NY_Interior_2284_fp706720_gizy0g.jpg')
)

new_room5.photo.attach(
  filename: 'jpn-pottery.jpg',
  io: URI.open('https://res.cloudinary.com/dfv1szuzs/image/upload/v1684307998/main03_nwvnnp.jpg')
)

new_room6.photo.attach(
  filename: 'small-apt.jpg',
  io: URI.open('https://res.cloudinary.com/dfv1szuzs/image/upload/v1684378669/pexels-amina-filkins-5425123_witoki.jpg')
)

new_room7.photo.attach(
  filename: 'jewelry-store.jpg',
  io: URI.open('https://res.cloudinary.com/dfv1szuzs/image/upload/v1684378675/pexels-yasemin-durmus-14789188_t775t6.jpg')
)
