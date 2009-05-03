class Zone < ActiveRecord::Base
  generator_for :geom, :method => :poly_build
  generator_for :name, :method => :next_name
  generator_for :kind => "comercial"

  def self.next_name
    @last ||= "Area massa"
    @last = @last.succ
  end

  def self.poly_build
    se = Point.from_x_y(-44,-22)
    sw = Point.from_x_y(-45 - rand(8), -22)
    nw = Point.from_x_y(-45 - rand(8), -21 + rand(10))
    ne = Point.from_x_y(-44,-21)
    Polygon.from_points([[se,sw,nw,ne,se]])
  end

end
