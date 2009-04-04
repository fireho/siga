require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Publication do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    Publication.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: publications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

