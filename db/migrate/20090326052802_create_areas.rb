class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string :name
      t.string :kind
      t.polygon :geom, :srid => 4236

      t.timestamps
    end

    add_index :areas, :name
    add_index :areas, :kind
    add_index :areas, :geom, :spatial => true

  end

  def self.down
    drop_table :areas
  end
end
