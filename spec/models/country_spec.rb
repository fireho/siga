require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Country do

  it "should create a new instance given valid attributes" do
    Country.generate!
  end

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: countries
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

