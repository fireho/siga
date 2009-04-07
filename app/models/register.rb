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
class Register < ActiveRecord::Base
  has_money :value


  state_machine :state, :initial => :open do
     event :pay do
        transition :open => :closed
      end

  end

  def close
    update_attribute(:cleared_at, Time.now)
  end

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: registers
#
#  id               :integer         not null, primary key
#  registrable_id   :integer
#  registrable_type :string(255)
#  name             :string(255)
#  value_cents      :integer         default(0), not null
#  sign             :boolean         not null
#  due_at           :timestamp
#  cleared_at       :timestamp
#  created_at       :timestamp
#  updated_at       :timestamp
#

