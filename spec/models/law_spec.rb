require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Law do
  before(:each) do
    @valid_attributes = {
      :content => "value for content",
      :wrote_at => Time.now,
      :valid_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Law.create!(@valid_attributes)
  end
end
