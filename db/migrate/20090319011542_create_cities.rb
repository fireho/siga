class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.references :country, :null => false
      t.references :province
      t.string :name, :permalink, :null => false
      t.integer :pop, :null => false, :default => 1
      t.polygon :geom, :srid => 4326

      t.timestamps
    end

    add_index :cities, :province_id
    add_index :cities, :country_id
    add_index :cities, :name
    add_index :cities, :permalink
    add_index :cities, :pop
    add_index :cities, :geom, :spatial => true
  end

  def self.down
    drop_table :cities
  end
end
