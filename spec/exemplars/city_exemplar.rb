class City < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :geom => Point.from_x_y(5,5)

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

