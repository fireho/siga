class Property < ActiveRecord::Base
  belongs_to :area
  acts_as_geom :geom

  symbolize :use, :in  => [:public, :residence, :store, :factory, :terrain, :other]
  symbolize :kind, :in => [:wood, ]
  has_many :addresses, :as => :addressable
  belongs_to :zone

  def str_geom= value
    self.geom = Polygon.from_coordinates([JSON.parse(value)])
  end

  def str_geom
    geom.nil? ? '[]' : (geom[0].map { |p| [p.x,p.y] }).to_json
  end

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['properties.name like ?', "%#{filter}%"],
    :order => 'properties.created_at'
  end
end
