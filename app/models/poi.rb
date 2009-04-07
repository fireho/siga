class Poi < ActiveRecord::Base
  include GeoPoint
  acts_as_geom :geom

  symbolize :kind, :in => [ :poi, :company, :hostel, :bank, :factory,
                            :attraction, :food, :airport, :police]

  before_validation :create_geom
  validates_presence_of :name
  validates_presence_of :geom, :message => "Marque o ponto"

  def text
    POI_TYPES[poi_type.to_sym]
  end

  def trac=(trac)
    return unless trac = Trac.find_by_nick(trac)
    self.geom = trac.geom
    self.group = trac.group
  end

  # Instantiate self.geom as a Point
  def create_geom
    unless !@x || !@y || @x == "" || @y == ""
      self.geom = Point.from_x_y_z(@x.to_f,@y.to_f,@z.to_f)
    end
  end

  def name=(_name)
    return unless _name
    self[:name] = _name.upcase
  end


  def self.search(search,page)
    paginate :page => page, :conditions => ['pois.name like ?', "%#{search}%"],
      :order => 'pois.name'
  end

end



