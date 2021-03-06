Given /^a user visits the sign in page$/ do
  visit new_user_session_path
end

When /^the user want to log in$/ do
  fill_in 'Email', with: 'axixe92@gmail.com'
  fill_in 'Password', with: '921117'
  click_button "Log in"
end

Then /^I should see Pizza$/ do
  @task = Task.new(title: 'Pizza')
  expect(@task.title).to eq('Pizza')
end

And /^I do not have tasks now$/ do
  Task.delete_all
end
