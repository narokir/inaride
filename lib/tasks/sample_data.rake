namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
<<<<<<< HEAD
    20.times do
      name = Faker::Name.name
      email = Faker::Internet.free_email
      usr_img = "/assets/user_placeholder.png"
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      password = "foobar"
      password_confirmation = "foobar"
      
      User.create!(name: name,
                   email: email,
                   usr_img: usr_img,
                   first_name: first_name,
                   last_name: last_name,
                   password: password,
                   password_cofirmation: password_confirmation)
      
      users = User.all(limit: 8)
      10.times do
	notes = Faker::Lorem.sentence(5)
	origin = "#{Faker::Address.city}, #{Faker::Address.us_state_abbr}"
	destination = "#{Faker::Address.city}, #{Faker::Address.us_state_abbr}"
	latitude = "35.6009452"
	longitude = "-82.55401499999999"
	date = "2012-11-07"
	price = "43"
	seats = "3"
	
	users.each { |user| user.rides.create!(notes: notes,
					      origin: origin,
					      destination: destination,
					      date: date,
					      price: price,
					      seats: seats,
					      latitude: latitude,
					      longitude: longitude) }
	
      end
      

=======
    User.create!(name: "Example User",
                 email: "example@inoride.com")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@inoride.com"
      usr_img = "/assets/user_placeholder.png"
      first_name = "ExampleUser"
      User.create!(name: name,
                   email: email,
                   usr_img: usr_img,
                   first_name: first_name)
      users = User.all(limit: 6)
      50.times do
	  notes = Faker::Lorem.sentence(5)
	  origin = "Asheville, NC"
	  destination = "Boston, MA"
	  latitude = "35.6009452"
	  longitude = "-82.55401499999999"
	  date = "2012-11-07"
	  price = "43"
	  seats = "3"
	  users.each { |user| user.rides.create!(notes: notes,
						 origin: origin,
						 destination: destination,
						 date: date,
						 price: price,
						 seats: seats,
						 latitude: latitude,
						 longitude: longitude) }
      end
>>>>>>> 1a50efd987ec34acbb6320229a971099cad3ffaa
    end
  end
end