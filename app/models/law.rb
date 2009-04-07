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
class Law < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :user

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['laws.title like ?', "%#{filter}%"],
    :order => 'laws.created_at'
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: laws
#
#  id            :integer         not null, primary key
#  person_id     :integer
#  user_id       :integer
#  parent_id     :integer
#  lft           :integer
#  rgt           :integer
#  state         :string(50)
#  kind          :string(50)
#  title         :string(255)
#  code          :string(255)
#  content       :text
#  wrote_at      :timestamp
#  publicated_at :timestamp
#  valid_at      :timestamp
#  expire_at     :timestamp
#  created_at    :timestamp
#  updated_at    :timestamp
#

