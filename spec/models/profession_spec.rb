require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Profession do
  it "should create a new instance given valid attributes" do
    Profession.generate!
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: professions
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  kind         :string(255)
#  person_count :integer
#  created_at   :timestamp
#  updated_at   :timestamp
#

