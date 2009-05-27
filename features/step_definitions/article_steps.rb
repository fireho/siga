# Given /^I am logged in as an (.+)$/ do |role|
#   auth_login_as role
# end

Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  unless username.blank?
    visit login_path
    fill_in "user_session_login", :with => username
    fill_in "user_session_password", :with => password
    click_button "Entrar"
  end
end

Given /^I have articles titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Article.create!(:title => title, :body => title, :user => User.generate)
  end
end

Given /^I have no articles$/ do
  Article.delete_all
end

Then /^I should have ([0-9]+) article$/ do |count|
  Article.count.should == count.to_i
end
