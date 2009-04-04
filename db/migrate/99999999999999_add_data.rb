class AddData < ActiveRecord::Migration
  def self.up
    Sector.create(:name => "TI")
    User.create!(:login => "admin", :password => "admin", :name => "admin", :kind => :admin,
                 :password_confirmation => "admin", :state => :active,
                 :email => "admin@siga.com", :time_zone => "Brasilia")

  end

  def self.down
    Sector.delete_all
    User.delete_all
  end
end
