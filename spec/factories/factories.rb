FactoryGirl.define do
  factory :user do
    first_name 'Test User'
    email 'example@example.com'
    password 'foobar'
    password_confirmation 'foobar'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end

