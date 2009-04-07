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
class Procurement < ActiveRecord::Base

  validates_presence_of :title

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['procurements.title like ?', "%#{filter}%"],
    :order => 'procurements.created_at'
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: procurements
#
#  id          :integer         not null, primary key
#  title       :string(255)     not null
#  body        :text            not null
#  limit_cents :integer
#  value_cents :integer
#  due_at      :timestamp
#  created_at  :timestamp
#  updated_at  :timestamp
#

