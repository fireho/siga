class User < ActiveRecord::Base
  generator_for :login, :method => :next_login
  generator_for :kind => "admin"
  generator_for :password => "secret"
  generator_for :password_confirmation => "secret"


  def self.next_login
     @next_login ||= "dummons"
     @next_login = @next_login.succ
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

