require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Charter do
  before(:each) do
    @valid_attributes = {
      :code => "value for code",
      :restrictions => "value for restrictions"
    }
  end

  it "should create a new instance given valid attributes" do
    Charter.create!(@valid_attributes)
  end
end
