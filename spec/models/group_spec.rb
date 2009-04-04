require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Group do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :official_name => "value for official_name",
      :kind => "value for kind",
      :creation => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Group.create!(@valid_attributes)
  end
end
