class City < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :geom => Point.from_x_y(5,5)

  def self.next_name
     Faker::Name.name
  end
end


# == Schema Information
# Schema version: 20090301000300
#
# Table name: cities
#
#  id          :integer         not null, primary key
#  province_id :integer
#  country_id  :integer         not null
#  name        :string(50)      not null
#  geom        :geometry        point, 4326
#  area        :geometry        polygon, 4326
#

