require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Group do


  it "should create a new instance given valid attributes" do
    Group.generate!
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: groups
#
#  id            :integer         not null, primary key
#  name          :string(255)     not null
#  official_name :string(255)     not null
#  kind          :string(255)
#  state         :string(255)
#  creation      :date
#  created_at    :timestamp
#  updated_at    :timestamp
#

