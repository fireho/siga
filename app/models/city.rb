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

class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :province
  has_many :zones
  has_friendly_id :name

  validates_presence_of :country
  validates_presence_of :name
end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: cities
#
#  id          :integer         not null, primary key
#  country_id  :integer         not null
#  province_id :integer
#  name        :string(255)     not null
#  permalink   :string(255)     not null
#  pop         :integer         default(1), not null
#  created_at  :timestamp
#  updated_at  :timestamp
#  geom        :geometry        polygon, 4326
#

