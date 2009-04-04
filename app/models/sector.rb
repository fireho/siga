# -*- coding: utf-8 -*-
class Sector < ActiveRecord::Base

  has_many :users
  has_many :addresses, :as => :addressable
  has_many :contacts, :as => :contactable

  validates_presence_of :name, :message => "O campo Setor não pode estar em branco!"
  validates_uniqueness_of :name, :message => "Setor já cadastrada na base de dados!"

  def self.search(pesquisar, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['setor like ?', "%#{pesquisar}%"],
             :order => 'setor'
  end

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: sectors
#
#  id         :integer         not null, primary key
#  manager_id :integer
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

