require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Opt do
  before(:each) do
    @valid_attributes = {
      :key => "value for key",
      :value => "value for value"
    }
  end

  it "should create a new instance given valid attributes" do
    Opt.create!(@valid_attributes)
  end
end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: opts
#
#  id         :integer         not null, primary key
#  key        :string(255)
#  value      :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

