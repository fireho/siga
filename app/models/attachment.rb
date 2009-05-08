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
class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :media,
                    :styles => { :thumb => ["200x200#", :png] },
                    :path => ':rails_root/public/files/attachments/:id/:style/:basename.:extension',
                    :url => '/files/attachments/:id/:style/:basename.:extension'
  validates_attachment_presence :media
  
  def self.search(filter, page)
    paginate :per_page => 20, :page => page,
    :conditions => ['info like ?', "%#{filter}%"],
    :order => 'id'
  end

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: attachments
#
#  id                 :integer         not null, primary key
#  attachable_id      :integer
#  attachable_type    :string(255)
#  media_file_name    :string(255)
#  media_content_type :string(255)
#  media_file_size    :integer
#  media_updated_at   :timestamp
#  info               :text
#  created_at         :timestamp
#  updated_at         :timestamp
#

