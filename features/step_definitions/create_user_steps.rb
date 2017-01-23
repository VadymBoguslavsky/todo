Given /^I have tasks titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Task.create!(:title => title)
  end
end
Given /^a user visits the signin page$/ do
  fill_in "Email", with: 'axixe92@gmail.com'
  fill_in "Password", with: 921117
  click_button "Log in"
end

When /^the user want to log in$/ do
  visit new_user_session_path
end

Then /^I should see Pizza$/ do
  @task = Task.new(title: 'Pizza')
  expect(@task) == {:title => 'Pizza'}
  expect(@task.title).to eq('Pizza')
end

And /^I do not have tasks now$/ do
  Task.delete_all
end
