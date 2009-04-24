class AddData < ActiveRecord::Migration
  FAKES =   [Publication, Article, Person, Group, Law, Area, Procurement,
            City]

  def self.up
    Sector.create(:name => "TI")
    User.create!(:login => "admin", :password => "admin", :name => "admin", :kind => :admin,
                 :password_confirmation => "admin", :state => :active, :locale => "pt",
                 :email => "admin@siga.com", :time_zone => "Brasilia")

    # Load bunch of dumb data in devel mode....
    if RAILS_ENV =~ /development/
      FAKES.each do |f|
        20.times {  f.generate! }
      end
    end

  end

  def self.down
    FAKES.each { |f| f.delete_all }
  end
end
