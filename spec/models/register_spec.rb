require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Register do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :value_cents => 1,
      :sign => false,
      :due_at => Time.now,
      :cleared_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Register.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: registers
#
#  id               :integer         not null, primary key
#  registrable_id   :integer
#  registrable_type :string(255)
#  name             :string(255)
#  value_cents      :integer         default(0), not null
#  sign             :boolean         not null
#  due_at           :timestamp
#  cleared_at       :timestamp
#  created_at       :timestamp
#  updated_at       :timestamp
#

