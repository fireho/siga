class Address < ActiveRecord::Base
  generator_for :name, :method => :some_name
  generator_for :prefix => "street"
  generator_for :geom, :method => :random_point

  def self.random_point
    Point.from_x_y(-(rand(2) + 50 + rand), -(rand(10) + 15 + rand))
  end

  def self.some_name
    @last ||= "Ponto Interessante 1"
    @last = @last.succ
  end
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

