require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Procurement do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :body => "value for body",
      :due_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Procurement.create!(@valid_attributes)
  end
end
