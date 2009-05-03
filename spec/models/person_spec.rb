require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Person do

  it "should create a new instance given valid attributes" do
    Person.generate!
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: people
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  sex            :string(255)
#  marital_status :string(255)
#  birth          :date
#  birthplace     :string(255)
#  time_residence :string(255)
#  profession     :string(255)
#  income         :integer
#  housing        :string(255)
#  type_housing   :string(255)
#  type_house     :string(255)
#  room           :integer
#  revenue        :integer
#  habitantes     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

