require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Procurement do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :body => "value for body",
      :due_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Procurement.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: procurements
#
#  id          :integer         not null, primary key
#  title       :string(255)     not null
#  body        :text            not null
#  limit_cents :integer
#  value_cents :integer
#  due_at      :timestamp
#  created_at  :timestamp
#  updated_at  :timestamp
#

