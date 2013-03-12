FactoryGirl.define do
  # post factory with a `belongs_to` association for the user
  factory :ride do |ride|
    ride.origin "Asheville, NC"
    ride.destination "Boston, MA"
    ride.date "2013-03-01"
    ride.price "45"
    ride.seats "3"
    user
  end

  # user_with_posts will create post data after the user has been created
  factory :user_with_rides do
    # posts_count is declared as an ignored attribute and available in
    # attributes on the factory, as well as the callback via the evaluator
    ignore do
      rides_count 5
    end

    # the after(:create) yields two values; the user instance itself and the
    # evaluator, which stores all values from the factory, including ignored
    # attributes; `create_list`'s second argument is the number of records
    # to create and we make sure the user is associated properly to the post
    after(:create) do |user, evaluator|
      FactoryGirl.create_list(:ride, evaluator.rides_count, user: user)
    end
  end
end