class CreatePois < ActiveRecord::Migration
  def self.up
    create_table :pois do |t|
      t.string :name, :null => false
      t.point :geom, :srid => 4326, :with_z => true, :null => false
      t.string :kind, :limit => 20, :default => "poi", :null => false

      t.timestamps
    end

    add_index :pois, :geom, :spatial => true
    add_index :pois, :name
    add_index :pois, :kind
  end

  def self.down
    drop_table :pois
  end
end
