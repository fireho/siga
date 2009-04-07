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
class Publication < ActiveRecord::Base
  belongs_to :person
  belongs_to :user
  has_permalink :title, :update => true

  validates_presence_of :user

  symbolize :kind, :in => [:edict, :decree, :order, :note]

  def self.search(filter, page)
    paginate :per_page => 5, :page => page,
    :conditions => ['publications.title like ?', "%#{filter}%"],
    :order => 'publications.created_at DESC'
  end

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: publications
#
#  id           :integer         not null, primary key
#  person_id    :integer
#  user_id      :integer         not null
#  kind         :string(255)     not null
#  title        :string(255)     not null
#  permalink    :string(255)     not null
#  published    :boolean         not null
#  published_at :timestamp
#  wrote_at     :timestamp
#  body         :text
#  created_at   :timestamp
#  updated_at   :timestamp
#

