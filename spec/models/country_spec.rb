require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Country do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :abbr => "value for abbr"
    }
  end

  it "should create a new instance given valid attributes" do
    Country.create!(@valid_attributes)
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
#  created_at :datetime
#  updated_at :datetime
#

