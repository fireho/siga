require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Calendar do
  before(:each) do
    @valid_attributes = {
      :day => Date.today,
      :business => false,
      :yearly => false,
      :note => "value for note"
    }
  end

  it "should create a new instance given valid attributes" do
    Calendar.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: calendars
#
#  id         :integer         not null, primary key
#  day        :date
#  business   :boolean
#  yearly     :boolean
#  note       :text
#  created_at :timestamp
#  updated_at :timestamp
#

