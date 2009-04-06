require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PersonImpairment do
  before(:each) do
    @valid_attributes = {
      :person => ,
      :kind => "value for kind",
      :start_at => Time.now,
      :info => "value for info"
    }
  end

  it "should create a new instance given valid attributes" do
    PersonImpairment.create!(@valid_attributes)
  end
end
