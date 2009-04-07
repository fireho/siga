require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Relative do
  before(:each) do
    @valid_attributes = {
      :person => ,
      :other => ,
      :kind => "value for kind"
    }
  end

  it "should create a new instance given valid attributes" do
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

