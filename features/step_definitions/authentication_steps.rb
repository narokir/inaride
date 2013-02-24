Given /^a user visits the signin page$/ do
  visit user_session_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_content('Invalid email or password.')
end

Given /^the user has an account$/ do
    @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "user[email]",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end

Then /^he should see his profile links$/ do
  page.should have_selector('ul#signedin_user_links')
end

Then /^he should see a signout link$/ do
  page.should have_content('Sign out')
end



