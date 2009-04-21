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
class Address < ActiveRecord::Base
  attr_writer :x, :y, :z
  belongs_to :addressable, :polymorphic => true
  belongs_to :city
  acts_as_geom :geom

  symbolize :prefix, :in => [:street, :airport, :area, :avenue, :lote]

  validates_presence_of :geom, :message => "Marque o ponto"
  validates_presence_of :city

  # Instantiate self.geom as a Point
  def create_geom
    unless !@x || !@y || @x == "" || @y == ""
      self.geom = Point.from_x_y_z(@x.to_f,@y.to_f,@z.to_f)
    end
  end

  def self.search(search,page)
    paginate :page => page, :conditions => ['address.street like ?', "%#{search}%"],
      :order => 'address.street'
  end

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  addressable_id   :integer
#  addressable_type :string(255)
#  city_id          :integer         not null
#  area_id          :integer
#  prefix           :string(40)
#  kind             :string(40)
#  number           :string(40)
#  zip_code         :string(40)
#  name             :string(255)
#  complement       :string(255)
#  info             :text
#  created_at       :timestamp
#  updated_at       :timestamp
#  geom             :geometry        point, 4326
#

