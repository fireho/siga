require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ad do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :kind => "value for kind",
      :body => "value for body",
      :start_at => Time.now,
      :end_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Ad.create!(@valid_attributes)
  end
end
