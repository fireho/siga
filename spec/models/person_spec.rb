require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Person do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :sex => "value for sex",
      :marital_status => "value for marital_status",
      :birth => Date.today,
      :birthplace => "value for birthplace",
      :time_residence => "value for time_residence",
      :profession => "value for profession",
      :income => 1,
      :housing => "value for housing",
      :type_housing => "value for type_housing",
      :type_house => "value for type_house",
      :room => 1,
      :revenue => 1,
      :habitantes => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Person.create!(@valid_attributes)
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

