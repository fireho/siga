require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Service do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :kind => "value for kind",
      :value_cents => 1,
      :start_at => Time.now,
      :end_at => Time.now,
      :done => false
    }
  end

  it "should create a new instance given valid attributes" do
    Service.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: services
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  kind        :string(255)
#  value_cents :integer
#  start_at    :timestamp
#  end_at      :timestamp
#  done        :boolean
#  created_at  :timestamp
#  updated_at  :timestamp
#

