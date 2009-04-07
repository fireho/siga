require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Family do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :people_count => 1,
      :revenue_cents => 1,
      :kind => "value for kind",
      :state => "value for state"
    }
  end

  it "should create a new instance given valid attributes" do
    Family.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: families
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  people_count  :integer
#  revenue_cents :integer
#  kind          :string(255)
#  state         :string(255)
#  created_at    :timestamp
#  updated_at    :timestamp
#

