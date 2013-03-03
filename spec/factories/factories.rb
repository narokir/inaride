FactoryGirl.define do
  factory :user do
    first_name 'Random'
    last_name  "User"
    email 'random@example.com'
    password 'foobar'
    password_confirmation 'foobar'
    admin false
  end
  
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
    email 'admin@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
  
  factory :basicuser do
    first_name 'basic'
    last_name  "User"
    email 'basicuser@example.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end

