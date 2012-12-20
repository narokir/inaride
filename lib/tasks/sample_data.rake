namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
admin = User.create!(name: 			"Admin User",
		         first_name: 		"AdminFirst",
			 last_name: 		"AdminLast",
                         email: 		"admin@somehost.com",
                         password: 		"foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    
    10.times do
      name = Faker::Name.name
      email = Faker::Internet.free_email
      usr_img = "/assets/user_placeholder.png"
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      password = "foobar"
      
      User.create!(name: 			name,
                   email: 			email,
                   usr_img: 			usr_img,
                   first_name: 			first_name,
                   last_name: 			last_name,
                   password: 			password,
                   password_cofirmation: 	password)
      
      users = User.all(limit: 6)
      10.times do
	notes = Faker::Lorem.sentence(5)
	origin = "#{Faker::Address.city}, #{Faker::Address.us_state_abbr}"
	destination = "#{Faker::Address.city}, #{Faker::Address.us_state_abbr}"
	latitude = "35.6009452"
	longitude = "-82.55401499999999"
	date = "2012-11-07"
	price = "43"
	seats = "3"
	time = "23:00:00"
	
	users.each { |user| user.rides.create!(notes:		notes,
					      origin: 		origin,
					      destination: 	destination,
					      date: 		date,
					      price: 		price,
					      seats: 		seats,
					      latitude: 	latitude,
					      longitude: 	longitude,
					      time:		time)
		    }
	
      end
      

    end
  end
end