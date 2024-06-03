require 'faker'

Given "I am on application login page" do
  visit "https://secure.simplepractice.com/users/sign_in"
end

And(/^I log in as '(.*)' user$/) do |user|
  user_creds = Helpers::DataHelper.users[:"#{user}"]

  if user_creds.nil?
    raise "No such user as #{user}"
  else
    login_page.log_in(user_creds[:username], user_creds[:password])
  end
end

And(/^I '(.*)' on '(.*)'$/) do |method_name, page_name|
    page = send(page_name)
    page.send(method_name)
end

And(/^I use '(.*)' user data faker$/) do |user_data|
  test_val = user_data

  user_fake_data = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    mobile_phone: Faker::PhoneNumber.cell_phone
  }

  Helpers::DataHelper.feature_variables[:"#{test_val}"] = user_fake_data
end

And(/^I '([^']*)' on '([^']*)' using '([^']*)' variable$/) do |method_name, page_name, variable_name|
  param = Helpers::DataHelper.feature_variables[:"#{variable_name}"]
  
  page = send(page_name)
  page.send(method_name, param)
end

And(/^I '(.*)' on '(.*)' using '(.*)' value$/) do |method_name, page_name, value|
  page = send(page_name)
  page.send(method_name, value)
end
