class Area < ActiveRecord::Base
  belongs_to :zone
  has_many :properties
  acts_as_geom :geom


   def str_geom= value
    self.geom = Polygon.from_coordinates([JSON.parse(value)])
  end

  def str_geom
    geom.nil? ? '[]' : (geom[0].map { |p| [p.x,p.y] }).to_json
  end

end
