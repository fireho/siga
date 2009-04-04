require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Relative do
  before(:each) do
    @valid_attributes = {
      :person => ,
      :other => ,
      :kind => "value for kind"
    }
  end

  it "should create a new instance given valid attributes" do
    Relative.create!(@valid_attributes)
  end
end
