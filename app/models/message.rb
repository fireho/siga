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
class Message < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :from_id, :class_name => "User"
  belongs_to :receiver, :foreign_key => :to_id, :class_name => "User"
  belongs_to :parent, :foreign_key => :parent_id, :class_name => "Message"

  validates_presence_of :sender, :receiver
  validates_presence_of :subject, :body
  validates_length_of :subject, :maximum => 254

  named_scope :unread, :conditions => { :read => false }
  named_scope :old, :conditions => { :read => true }


  def to_login
    receiver.andand.login
  end

  def to_login=(name)
    self.receiver = user.find_by_login(name)
  end

  def read!
    update_attribute(:read, true)
  end

  def self.search(page=1, search="")
    paginate(:page=>page, :order=>'created_at DESC')
    #:conditions => ['subject like ?', "%#{search}%"],
  end

end

# == Schema Information
# Schema version: 20090212033414
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  from_id    :integer         not null
#  to_id      :integer         not null
#  parent_id  :integer
#  subject    :string(255)     not null
#  body       :text            not null
#  read       :boolean         not null
#  created_at :timestamp
#  updated_at :timestamp
#

