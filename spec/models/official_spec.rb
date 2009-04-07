require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Official do
  before(:each) do
    @valid_attributes = {
      :hired_at => Time.now,
      :post => "value for post"
    }
  end

  it "should create a new instance given valid attributes" do
    Official.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: officials
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  hired_at   :timestamp
#  post       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

