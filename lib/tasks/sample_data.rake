namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
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
    end
  end
end