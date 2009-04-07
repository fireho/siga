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
class Property < ActiveRecord::Base
  belongs_to :area
  acts_as_geom :geom

  symbolize :use, :in  => [:public, :residence, :store, :factory, :terrain, :other]
  symbolize :kind, :in => [:wood, :masonry ]
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

# == Schema Information
# Schema version: 99999999999999
#
# Table name: properties
#
#  id         :integer         not null, primary key
#  area_id    :integer
#  person_id  :integer
#  name       :string(255)
#  condition  :string(20)
#  kind       :string(20)
#  road       :string(20)
#  drain      :string(20)
#  power      :string(20)
#  garbage    :string(20)
#  water      :string(20)
#  rooms      :integer
#  built_at   :date
#  info       :text
#  created_at :timestamp
#  updated_at :timestamp
#  geom       :geometry        multi_polygon, 4326
#

