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

# == Schema Information
# Schema version: 99999999999999
#
# Table name: areas
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  zone_id    :integer
#  name       :string(255)
#  kind       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#  geom       :geometry        polygon, 4326
#

