require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Zone do

  it "should create a new instance given valid attributes" do
    Zone.generate!
  end

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: zones
#
#  id         :integer         not null, primary key
#  city_id    :integer
#  kind       :string(255)     not null
#  name       :string(255)     not null
#  created_at :timestamp
#  updated_at :timestamp
#  geom       :geometry        polygon, 4326
#

