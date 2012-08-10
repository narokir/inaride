# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# encoding: utf-8
users = User.create([{ name: 'narokir', email:'Naro@email.com', img_url:'user.png', provider: 'facebook', uid:'1' }])
rides = Ride.create([{ title: 'RideTitle', origin:'Miami', destination:'Boston', latitude: '', longitude:'',date:'',user_id:'',gmaps: 'true' }])

#User.create(email: 'Emanuel', user: users.first)
