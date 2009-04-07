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

# == Schema Information
# Schema version: 99999999999999
#
# Table name: laws
#
#  id            :integer         not null, primary key
#  person_id     :integer
#  user_id       :integer
#  parent_id     :integer
#  lft           :integer
#  rgt           :integer
#  state         :string(50)
#  kind          :string(50)
#  title         :string(255)
#  code          :string(255)
#  content       :text
#  wrote_at      :timestamp
#  publicated_at :timestamp
#  valid_at      :timestamp
#  expire_at     :timestamp
#  created_at    :timestamp
#  updated_at    :timestamp
#

