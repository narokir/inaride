# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ name: 'narokir', email:'Naro@email.com', img_url:'<img src="/assets/inoride_logo.png"/>', provider: 'facebook', uid:'1' }])
#User.create(email: 'Emanuel', user: users.first)
