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
#  kind       :string(255)     not null
#  name       :string(255)     not null
#  created_at :timestamp
#  updated_at :timestamp
#  geom       :geometry        polygon, 4326
#

