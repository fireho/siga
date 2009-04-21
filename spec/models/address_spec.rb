require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Address do
  it "should generate" do
    Address.generate!
  end

  it { should belong_to :addressable, :polymorphic => true }

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  addressable_id   :integer
#  addressable_type :string(255)
#  city_id          :integer         not null
#  area_id          :integer
#  prefix           :string(40)
#  kind             :string(40)
#  number           :string(40)
#  zip_code         :string(40)
#  name             :string(255)
#  complement       :string(255)
#  info             :text
#  created_at       :timestamp
#  updated_at       :timestamp
#  geom             :geometry        point, 4326
#

