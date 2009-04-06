require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Profession do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :kind => "value for kind",
      :person_count => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Profession.create!(@valid_attributes)
  end
end
