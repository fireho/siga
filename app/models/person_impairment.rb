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
class PersonImpairment < ActiveRecord::Base
  belongs_to :person
  symbolize :kind, :in => [:visual, :auditive]

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: person_impairments
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  kind       :string(255)
#  start_at   :timestamp
#  info       :text
#  created_at :timestamp
#  updated_at :timestamp
#

