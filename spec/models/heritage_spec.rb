require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Heritage do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :code => "value for code",
      :bought_at => Date.today,
      :value_cents => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Heritage.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: heritages
#
#  id          :integer         not null, primary key
#  property_id :integer
#  name        :string(255)
#  code        :string(255)
#  down_kind   :string(255)
#  state       :string(255)
#  value_cents :integer
#  sold_cents  :integer
#  info        :text
#  bought_at   :date
#  down_at     :date
#  created_at  :timestamp
#  updated_at  :timestamp
#

