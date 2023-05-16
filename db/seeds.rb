# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'cleaning database...'
Booking.destroy_all
Room.destroy_all
User.destroy_all

new_user = User.create(username: 'joe', email: 'joe@email.com', password: 'password', password_confirmation: 'password')
new_user1 = User.create(username: 'mathieu', email: 'mathieu@email.com', password: 'password', password_confirmation: 'password')

new_room = Room.new(
  name: 'Shinsetsu Break Room',
  address: '21 Taimei Bldg., 3 Chome-11-6 Roppongi, Minato City, Tokyo 106-0032',
  story: 'In the heart of bustling Tokyo, there stood a remarkable refuge called "Shinsetsu Break Room." Nestled amidst
  the towering skyscrapers,
  it offered a sanctuary for those burdened by the weight of toxic coworkers and unrelenting workplace stress.',
  description: 'This room is filled with 300 customable manequins. You can break them as you wish. You can also bring
  your own manequins.',
  capacity: 2,
  price: 9000
)

new_room1 = Room.new(
  name: 'Warehouse Break Room',
  address: 'Shibuya, Tokyo 150-0002',
  story: 'This room  was an old warehouse that was converted into a break room. It is located in the heart of the city.
  A lot of people died here because of the toxic fumes. The previous owner was never found.',
  description: 'This room contains a lot of old furniture. You can break them as you wish. You can also bring your own
   furniture',
  capacity: 2,
  price: 5000
)

new_room2 = Room.new(
  name: 'Fancy appartement',
  address: 'Chiyoda, Tokyo 100-0005',
  story: 'This appartment belongs to a cheater.',
  description: 'Destroy all the expensive in this appartment. You can also bring
   your own expensive stuff',
  capacity: 2,
  price: 7000
)

new_room3 = Room.new(
  name: 'Arcade to break',
  address: 'Shinjuku, Tokyo 160-0023',
  story: 'This room is an old game center.',
  description: 'You have at your disposal shotguns, baseball bats to destroy all the machines.',
  capacity: 2,
  price: 7000
)

new_room4 = Room.new(
  name: 'Apple Store',
  address: 'Minato, Tokyo 105-6333',
  story: 'This Apple Store is available to get fucked.',
  description: "If you cannot afford Apple's expensive stuff, come here and destroy everything.
  All the devices are fonctionnal. Please try them before.",
  capacity: 2,
  price: 7000
)

new_room5 = Room.new(
  name: 'Japanese Pottery',
  address: 'Taito, Kyoto 110-0005',
  story: 'This room belongs to the legendary Tanaka Smith.',
  description: 'This room is filled with fragile japanese crafted pottery. Come
  here to destroy everything and awake you soul.',
  capacity: 2,
  price: 7000
)

new_room.user = new_user  # the owner is Joe
new_room1.user = new_user # the owner is Joe
new_room2.user = new_user # the owner is Joe
new_room3.user = new_user # the owner is Joe
new_room4.user = new_user # the owner is Joe
new_room5.user = new_user # the owner is Joe

new_room.save
new_room1.save
new_room2.save
new_room3.save
new_room4.save
new_room5.save

new_booking = Booking.new(
  date: Date.today,
  number_of_people: 2,
  status: :requested
)
new_booking.user = new_user1 # the guest is Mathieu
new_booking.room = new_room
new_booking.save
