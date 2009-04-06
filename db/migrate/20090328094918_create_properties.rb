class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.references :area, :person
      t.string :name
      t.string :condition, :kind, :road, :drain,
               :power, :garbage, :limit => 20
      t.multi_polygon :geom, :srid => 4326
      t.integer :rooms
      t.date :built_at
      t.text :info

      t.timestamps
    end

    add_index :properties, :person_id
    add_index :properties, :condition
    add_index :properties, :kind
    add_index :properties, :area_id
    add_index :properties, :name
    add_index :properties, :geom, :spatial => true
  end

  def self.down
    drop_table :properties
  end
end
