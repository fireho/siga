class AddData < ActiveRecord::Migration
  def self.up
    Sector.create(:name => "TI")
    User.create!(:login => "admin", :password => "admin", :name => "admin", :kind => :admin,
                 :password_confirmation => "admin", :state => :active, :locale => "pt",
                 :email => "admin@siga.com", :time_zone => "Brasilia")

    # Load bunch of dumb data in devel mode....
    if RAILS_ENV =~ /development/
      [Publication, Article, Person, Group, Law, Area, Procurement].each do |k|
        20.times {  k.generate! }
      end
    end

  end

  def self.down
    Sector.delete_all
    User.delete_all
  end
end
