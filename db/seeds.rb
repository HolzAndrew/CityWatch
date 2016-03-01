# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.create([
  { city_lng: '39.2833', city_lat: '76.6176', name: "Baltimore"},
  ])

Officer.create([
  { first_name: 'Dee', last_name: 'Stacks', email: 't2@gmail.com', password: 't1', phone: '312-312-3120', city_id: 1},
  ])

Video.create([
  { }
  ])  
