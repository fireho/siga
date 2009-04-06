class Zone < ActiveRecord::Base
  belongs_to :city
  has_many :areas, :dependent => :nullify
  has_many :properties, :through => :areas

  acts_as_geom :geom

  has_many :properties, :dependent => :nullify

  symbolize :kind, :in => [:comercial, :industrial, :residential, :countryside]

  validates_presence_of :name

  def str_geom= value
    self.geom = Polygon.from_coordinates([JSON.parse(value)])
  end

  def str_geom
    geom.nil? ? '[]' : (geom[0].map { |p| [p.x,p.y] }).to_json
  end

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['zones.name like ?', "%#{filter}%"],
    :order => 'zones.name'
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: zones
#
#  id         :integer         not null, primary key
#  city_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

