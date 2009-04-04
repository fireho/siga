class CreateZones < ActiveRecord::Migration
  def self.up
    create_table :zones do |t|
      t.references :city
      t.string :kind, :null => false
      t.string :name, :null => false

      t.timestamps
    end

    add_index :zones, :kind
    add_index :zones, :city_id
  end

  def self.down
    drop_table :zones
  end
end
