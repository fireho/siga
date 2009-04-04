require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Register do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :value_cents => 1,
      :sign => false,
      :due_at => Time.now,
      :cleared_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Register.create!(@valid_attributes)
  end
end
