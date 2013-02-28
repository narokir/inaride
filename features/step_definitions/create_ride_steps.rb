Given /^a user visits new ride page$/ do
  visit new_ride_url
end

Given /^the user does not have an account$/ do
  current_user = nil
end

Then /^he is redirected to create a new ride page$/ do
  page.should have_selector('form#new_ride')
end

Then /^he should see the signin page$/ do
  visit user_session_path
  page.should have_selector('h2', text: 'Sign in')
end

Then /^the user submits valid ride information$/ do
  fill_in "ride[origin]",    with: "Asheville, NC"
  fill_in "ride[destination]",    with: "Boston, MA"
  fill_in "ride[date]",    with: "2013-02-01"
  fill_in "ride[price]",    with: "45"
  fill_in "ride_seats",    with: "3"
  click_button('Create Ride')
end

Then /^he should see the new ride page$/ do
  page.should have_selector('div.alert-success', text: 'Success! Ride Created.')
end








