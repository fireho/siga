class Area < ActiveRecord::Base
  belongs_to :zone
  has_many :properties
  acts_as_geom :geom

  validates_presence_of :name

  def str_geom= value
    self.geom = Polygon.from_coordinates([JSON.parse(value)])
  end

  def str_geom
    geom.nil? ? '[]' : (geom[0].map { |p| [p.x,p.y] }).to_json
  end

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['areas.name like ?', "%#{filter}%"],
    :order => 'areas.created_at'
  end

end
