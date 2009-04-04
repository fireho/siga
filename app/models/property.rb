class Property < ActiveRecord::Base
  belongs_to :area
  acts_as_geom :geom

  has_many :addresses, :as => :addressable
  belongs_to :zone

  def str_geom= value
    self.geom = Polygon.from_coordinates([JSON.parse(value)])
  end

  def str_geom
    geom.nil? ? '[]' : (geom[0].map { |p| [p.x,p.y] }).to_json
  end

end
