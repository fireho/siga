# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  belongs_to :sector
  has_many :publications

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    c.logged_in_timeout = 30.minutes
  #  c.login_field_validates_length_of_options = { :within => 3..30 }
   # c.login_field_validates_format_of_options = { :message => I18n.t('authlogic.validates.format_login_field') }
   # c.login_field_validates_uniqueness_of_options = { :allow_blank => false }
  end
  #attr_accessor :password, :password_confirmation, :password_atual, :conf_senha,
  #:conf_senha_confirmation, :tipo_formulario

  validates_presence_of :login, :message => 'Campo login não pode estar em branco.'
  validates_presence_of :name, :message => 'Campo nome não pode estar em branco.'
  #validates_presence_of :password, :message => 'Campo Senha não pode estar em branco.'#, :if => :get_formulario
  #validates_presence_of :password_confirmation, :message => 'Campo Confirma Senha não pode estar em branco.'#, :if => :get_formulario
  #validates_presence_of :password_atual, :on => :update, :message => 'Campo Senha Atual não pode estar em branco.', :if => :get_formulario

  validates_uniqueness_of :login, :message => 'Login já cadastrado na base de dados.'
  #validates_confirmation_of :password, :message => 'Campo Senha e Confirma Senha não conferem.'
  #validates_confirmation_of :conf_senha, :message =>  'Campo Senha Atual não confere.'

  def before_validation
    self.time_zone ||= "Brasilia"
    self.locale ||= "br"
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
#  last_login_at       :datetime
#  last_request_at     :datetime
#  current_login_at    :datetime
#  login_count         :integer
#  created_at          :datetime
#  updated_at          :datetime
#

