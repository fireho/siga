Given /^I have people named (.+)$/ do |names|
  names.split(', ').each do |name|
    Person.create!(:name => name)
  end
end

# Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
#   unless username.blank?
#     visit login_path
#     fill_in "user_session_login", :with => username
#     fill_in "user_session_password", :with => password
#     click_button "Entrar"
#   end
# end

Then /^I should have ([0-9]+) person$/ do |count|
  Person.count.should == count.to_i
end

Given /^I have no people$/ do
  Person.delete_all
end
