Given /^a ride exists$/ do
  @ride = FactoryGirl.create(:user).rides
end

When /^I sign in as "(.*?)" user$/ do |arg1|
  visit '/users/sign_in'
  fill_in "user[email]",    with: "random@example.com"
  fill_in "Password", with: "foobar" 
  click_button "Sign in"
  save_and_open_page
end

Given /^I visit a ride page$/ do
  visit ride_url(:ride)
end

Then /^I should be redirected to sign in page$/ do
  page. should == new_user_session_url
end


When /^I press "(.*?)" button$/ do |arg1|
  click_button "Request ride"
end

Then /^I should see the ride request form$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I submit valid ride request$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)" message$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
