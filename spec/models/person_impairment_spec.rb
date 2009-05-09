require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PersonImpairment do

  it "should create a new instance given valid attributes" do
    PersonImpairment.generate!
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

