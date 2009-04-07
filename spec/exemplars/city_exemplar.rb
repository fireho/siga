class City < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :geom, :method => :poly_build

  def self.poly_build
    se = Point.from_x_y(-44,-22)
    sw = Point.from_x_y(-45 - rand(8), -22)
    nw = Point.from_x_y(-45 - rand(8), -21 + rand(10))
    ne = Point.from_x_y(-44,-21)
    Polygon.from_points([[se,sw,nw,ne,se]])
  end

  def self.next_name
     Faker::Name.name
  end
end



# == Schema Information
# Schema version: 99999999999999
#
# Table name: cities
#
#  id          :integer         not null, primary key
#  country_id  :integer         not null
#  province_id :integer
#  name        :string(255)     not null
#  permalink   :string(255)     not null
#  pop         :integer         default(1), not null
#  created_at  :timestamp
#  updated_at  :timestamp
#  geom        :geometry        polygon, 4326
#

