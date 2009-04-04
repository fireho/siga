require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Storage do
  before(:each) do
    @valid_attributes = {
      :amount => "value for amount",
      :unit => "value for unit",
      :value_cents => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Storage.create!(@valid_attributes)
  end
end
