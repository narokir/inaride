Given /^the following (.+) records$/ do |factory, table|
  table.hashes.each do |hash|
    FactoryGirl.create(factory, hash)
  end
end

Given /^I am loged in as "(.*?)" with password "(.*?)"$/ do |email, password|
  visit '/users/sign_in'
  fill_in "user[email]",    with: email
  fill_in "Password", with: password 
  click_button "Sign in"
end

When /^I visit profile for user "(.*?)"$/ do |email|
  user = User.find_by_email!(email)
  visit user_url(user)
  #save_and_open_page
end

Then /^I should see "(.*?)" link$/ do |arg1|
  page.should have_link('Edit Profile')
end

Given /^an admin account exists$/ do
  admin = FactoryGirl.create(:admin)
end

Given /^a random user account exists$/ do
  admin = FactoryGirl.create(:user)
end

Given /^I login as admin$/ do
  visit '/users/sign_in'
  fill_in "user[email]",    with: 'admin@example.com'
  fill_in "Password", 	    with: 'foobar'
  click_button "Sign in"
end

When /^I visit a random users profile page$/ do
  user = User.find_by_email!('random@example.com')
  visit user_url(user)
end

Then /^I should see Edit Profile link$/ do
  user = User.find_by_email!('random@example.com')
  page.should have_link('Edit Profile', href: edit_user_path(user))
end


Given /^I am loged in as random user$/ do
  visit '/users/sign_in'
  fill_in "user[email]",    with: 'random@example.com'
  fill_in "Password", 	    with: 'foobar'
  click_button "Sign in"
end

When /^i vist profile for admin@example\.com$/ do
  user = User.find_by_email!('admin@example.com')
  visit user_url(user)
  
end

Then /^I should not see Edit Profile link$/ do
  user = User.find_by_email!('admin@example.com')
  page.should_not have_link('Edit Profile', href: edit_user_path(user))
end












