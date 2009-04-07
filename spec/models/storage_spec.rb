require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Storage do

  it "should create a new instance given valid attributes" do
    pending
    Storage.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: storages
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  kind        :string(255)
#  unit        :string(255)
#  amount      :decimal(15, 3)
#  unit_cents  :integer
#  total_cents :integer
#  created_at  :timestamp
#  updated_at  :timestamp
#

