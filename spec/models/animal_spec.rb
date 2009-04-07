require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Animal do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :born_at => Time.now,
      :age => 1,
      :sex => false,
      :kind => "value for kind",
      :fur => "value for fur",
      :race => "value for race"
    }
  end

  it "should create a new instance given valid attributes" do
    Animal.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: animals
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  name       :string(255)
#  born_at    :timestamp
#  age        :integer
#  sex        :boolean
#  kind       :string(255)
#  fur        :string(255)
#  race       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

