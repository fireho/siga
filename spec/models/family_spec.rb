require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Family do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :people_count => 1,
      :revenue_cents => 1,
      :kind => "value for kind",
      :state => "value for state"
    }
  end

  it "should create a new instance given valid attributes" do
    Family.create!(@valid_attributes)
  end
end
