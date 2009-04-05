class AddData < ActiveRecord::Migration
  def self.up
    Sector.create(:name => "TI")
    User.create!(:login => "admin", :password => "admin", :name => "admin", :kind => :admin,
                 :password_confirmation => "admin", :state => :active, :locale => "pt-BR",
                 :email => "admin@siga.com", :time_zone => "Brasilia")

    # Load bunch of dumb data in devel mode....
    if RAILS_ENV =~ /development/
      [Publication, Article, Person, Group, Law].each do |k|
        80.times {  k.generate! }
      end
      # 80.times { Publication.generate! }
      # 80.times { Person.generate! }
      # 80.times { Group.generate! }
      # 80.times { Law.generate! }
    end

  end

  def self.down
    Sector.delete_all
    User.delete_all
  end
end
