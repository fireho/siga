# -*- coding: utf-8 -*-
#
#   Copyright © 2009 Fireho
#
#   This file is part of SIGA.
#
#   SIGA is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   SIGA is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
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

