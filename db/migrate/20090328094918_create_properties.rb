class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.references :area
      t.string :name
      t.date :built_at
      t.multi_polygon :geom, :srid => 4236

      t.timestamps
    end

    add_index :properties, :area_id
    add_index :properties, :name
    add_index :properties, :geom, :spatial => true
  end

  def self.down
    drop_table :properties
  end
end
