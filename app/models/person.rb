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
class Person < ActiveRecord::Base
  belongs_to :birthplace, :class_name => "City"
  belongs_to :family, :counter_cache => true
  belongs_to :mom, :class_name => "Person"
  belongs_to :dad, :class_name => "Person"
  belongs_to :spouse, :class_name => "Person"
  has_many :documents, :as => :documentable#, :attributes => true
  has_many :addresses, :as => :addressable#, :attributes => true
  has_many :contacts, :as => :contactable#, :attributes => true
  accepts_nested_attributes_for :documents, :addresses, :contacts, :allow_destroy => true
  has_one :user

  has_money :revenue
  has_friendly_id :name, :use_slug => true
  autocomplete :dad, :mom, :spouse, :birthplace

  symbolize :blood, :in => [:"A+", :"A-", :"O+", :"O-", :"B+", :"B-", :"AB+", :"AB-"], :i18n => false
  symbolize :marital, :in => [:unknown, :single, :divorced, :married, :widowed, :common_law]
  symbolize :profession_state, :in => [:working, :retired], :allow_nil => true
  symbolize :sex, :in => [true, false]
  symbolize :race, :in => [:caucasian, :asian, :african, :indian], :allow_nil => true
  symbolize :state, :in => [:active, :inactive, :suspended, :moved, :deceased]
  validates_presence_of :name
  validates_length_of :name, :minimum => 5
  validates_numericality_of :height, :weight, :allow_nil => true

  # Human url
  # def to_param
  #   "#{id}-#{permalink}"
  # end

  # Filters
  def before_save
    calc_age
  end

  state_machine :state, :initial => :active do

    event :activate do
      transition all => :active
    end

    event :inactivate do
      transition :active => :inactive
    end

    event :suspend do
      transition all => :suspended
    end

    event :death do
      transition all => :deceased
    end
  end

  def calc_age
    return unless born_at
    write_attribute(:age, (Time.now - born_at)/60/60/24/360)
  end

  def self.search(filter, page)
    paginate :per_page => 20, :page => page,
    :conditions => ['name like ?', "%#{filter}%"],
    :order => 'name'
  end

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: people
#
#  id               :integer         not null, primary key
#  country_id       :integer
#  name             :string(255)     not null
#  permalink        :string(255)     not null
#  state            :string(255)     not null
#  sex              :boolean         not null
#  marital          :string(255)
#  education        :string(255)
#  profession       :string(255)
#  profession_state :string(255)
#  prefix           :string(5)
#  blood            :string(5)
#  race             :string(5)
#  revenue_cents    :integer
#  age              :integer
#  height           :integer
#  weight           :integer
#  birthplace_id    :integer
#  mom_id           :integer
#  dad_id           :integer
#  spouse_id        :integer
#  born_at          :timestamp
#  arrival_at       :date
#  leave_at         :date
#  created_at       :timestamp
#  updated_at       :timestamp
#

