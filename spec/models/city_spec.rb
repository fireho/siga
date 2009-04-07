require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe City do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :pop => 1
    }
  end

  it "should create a new instance given valid attributes" do
    City.create!(@valid_attributes)
  end
end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: cities
#
#  id          :integer         not null, primary key
#  country_id  :integer         not null
#  province_id :integer
#  name        :string(255)     not null
#  permalink   :string(255)     not null
#  pop         :integer         default(1), not null
#  created_at  :timestamp
#  updated_at  :timestamp
#  geom        :geometry        polygon, 4326
#

