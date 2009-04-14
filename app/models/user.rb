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
class User < ActiveRecord::Base

  belongs_to :person
    # has_attached_file :photo,
    #                 :styles => { :normal => '40x40#' },
    #                 :whiny_thumbnails => true,
    #                 :default_style => :normal,
    #                 :default_url => "bigicons/avatar.png",
    #                 :path => ":rails_root/public/files/user/photos/:style_:id.:extension",
    #                 :url => "/files/user/photos/:style_:id.:extension"


  #belongs_to :sector funcionarios...

  has_many :articles
  has_many :publications
  has_many :contacts, :through => :person
  has_many :messages, :foreign_key => :to_id
  has_many :messages_sent, :foreign_key => :from_id, :class_name => "Message"


  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    c.logged_in_timeout = 30.minutes
  #  c.login_field_validates_length_of_options = { :within => 3..30 }
   # c.login_field_validates_format_of_options = { :message => I18n.t('authlogic.validates.format_login_field') }
   # c.login_field_validates_uniqueness_of_options = { :allow_blank => false }
  end
  #attr_accessor :password, :password_confirmation, :password_atual, :conf_senha,
  #:conf_senha_confirmation, :tipo_formulario

  # validates_presence_of :login, :message => 'Campo login não pode estar em branco.'
  # validates_presence_of :name, :message => 'Campo nome não pode estar em branco.'
  #validates_presence_of :password, :message => 'Campo Senha não pode estar em branco.'#, :if => :get_formulario
  #validates_presence_of :password_confirmation, :message => 'Campo Confirma Senha não pode estar em branco.'#, :if => :get_formulario
  #validates_presence_of :password_atual, :on => :update, :message => 'Campo Senha Atual não pode estar em branco.', :if => :get_formulario

  # validates_uniqueness_of :login, :message => 'Login já cadastrado na base de dados.'
  #validates_confirmation_of :password, :message => 'Campo Senha e Confirma Senha não conferem.'
  #validates_confirmation_of :conf_senha, :message =>  'Campo Senha Atual não confere.'

  def before_validation
    self.time_zone ||= "Brasilia"
    self.locale ||= "pt"
  end

  def activate!
    self.update_attribute(:state, :active)
  end


  def self.search(pesquisar, page)
    paginate :per_page => 10, :page => page,
             :conditions => ['name like ?', "%#{pesquisar}%"],
             :order => 'name'
  end

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  login               :string(80)      not null
#  kind                :string(80)      not null
#  email               :string(100)
#  name                :string(100)     default("")
#  state               :string(255)     default("passive"), not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  time_zone           :string(50)      not null
#  locale              :string(50)      not null
#  last_login_at       :timestamp
#  last_request_at     :timestamp
#  current_login_at    :timestamp
#  login_count         :integer
#  created_at          :timestamp
#  updated_at          :timestamp
#

