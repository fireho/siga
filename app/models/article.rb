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
class Article < ActiveRecord::Base
  belongs_to :user
  has_many :medias, :as => :attachable
  has_friendly_id :title, :use_slug => true

  validates_presence_of :user
  validates_presence_of :title, :body

  named_scope :publica, :conditions => { :public => true }
  named_scope :published, :conditions => { :published => true }
  named_scope :ordered, :order => "created_at desc"
  named_scope :with_user, :include => [:user]
  named_scope :last_five, :limit => 5

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['articles.title like ?', "%#{filter}%"],
    :order => 'articles.created_at'
  end
end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  title      :string(255)     not null
#  permalink  :string(255)     not null
#  body       :text            not null
#  public     :boolean         not null
#  published  :boolean         not null
#  created_at :timestamp
#  updated_at :timestamp
#

