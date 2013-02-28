Given /^the following (.+) records?$/ do |factory, table|
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
  user = User.find_by_email(email)
end

Then /^I shoud see "(.*?)" link$/ do |link|
  page.should have_link('Edit Profile', href: edit_user_path)
end

