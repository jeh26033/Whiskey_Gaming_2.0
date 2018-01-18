# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)









99.times do |n|
  nickname  = Faker::Name.first_name
  uid=332231223+n
  
  User.create(nickname:  nickname,            
  	avatar_url: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/7f/7f96e39fe50521f2827181ddd40d7c41d32913f0_medium.jpg',
  	uid: uid
               )
end