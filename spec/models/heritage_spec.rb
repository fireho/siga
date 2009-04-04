require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Heritage do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :code => "value for code",
      :bought_at => Date.today,
      :value_cents => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Heritage.create!(@valid_attributes)
  end
end
