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

# == Schema Information
# Schema version: 99999999999999
#
# Table name: ads
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  title      :string(255)
#  kind       :string(255)
#  body       :text
#  start_at   :timestamp
#  end_at     :timestamp
#  published  :boolean
#  created_at :timestamp
#  updated_at :timestamp
#

