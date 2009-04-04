class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.references :zone
      t.string :name
      t.date :built_at
      t.polygon :geom, :srid => 4236

      t.timestamps
    end

    add_index :properties, :zone_id
    add_index :properties, :name
    add_index :properties, :geom, :spatial => true
  end

  def self.down
    drop_table :properties
  end
end
