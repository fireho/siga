class Poi < ActiveRecord::Base
  generator_for :name, :method => :some_name
  generator_for :geom, :method => :random_point
  generator_for :kind => :poi

  def self.random_point
    Point.from_x_y_z(-(rand(2) + 50 + rand), -(rand(10) + 15 + rand),0)
  end

  def self.some_name
    @last ||= "Ponto Interessante 1"
    @last = @last.succ
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: pois
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  kind       :string(20)      default("poi"), not null
#  created_at :timestamp
#  updated_at :timestamp
#  geom       :geometry        not null, point, 4326
#

