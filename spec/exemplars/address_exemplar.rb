class Address < ActiveRecord::Base
  generator_for :name, :method => :some_name
  generator_for :geom, :method => :random_point

  def self.random_point
    Point.from_x_y_z(-(rand(2) + 50 + rand), -(rand(10) + 15 + rand),0)
  end

  def self.some_name
    @last ||= "Ponto Interessante 1"
    @last = @last.succ
  end
end


