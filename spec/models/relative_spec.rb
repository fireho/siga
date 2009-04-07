require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Relative do

  it "should create a new instance given valid attributes" do
    pending
    Relative.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: relatives
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  other_id   :integer
#  kind       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

