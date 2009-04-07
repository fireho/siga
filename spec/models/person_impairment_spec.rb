require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PersonImpairment do
  before(:each) do
    @valid_attributes = {
      :person => ,
      :kind => "value for kind",
      :start_at => Time.now,
      :info => "value for info"
    }
  end

  it "should create a new instance given valid attributes" do
    PersonImpairment.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: person_impairments
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  kind       :string(255)
#  start_at   :timestamp
#  info       :text
#  created_at :timestamp
#  updated_at :timestamp
#

