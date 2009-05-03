require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Province do
  it "should create a new instance given valid attributes" do
    Province.generate!
  end

  it { should belong_to :country}

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: provinces
#
#  id         :integer         not null, primary key
#  country_id :integer
#  name       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

