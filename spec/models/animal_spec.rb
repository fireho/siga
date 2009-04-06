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
