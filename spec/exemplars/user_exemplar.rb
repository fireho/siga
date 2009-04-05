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
