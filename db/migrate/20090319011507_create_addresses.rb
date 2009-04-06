class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.references :city, :null => false
      t.references :area
      t.string :prefix, :kind, :number, :zip_code, :limit => 40
      t.string :name, :complement
      t.point :geom, :srid => 4326
      t.text :info

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
    add_index :addresses, :addressable_type
    add_index :addresses, :city_id
    add_index :addresses, :area_id
    add_index :addresses, :prefix
    add_index :addresses, :kind
    add_index :addresses, :geom, :spatial => true
    add_index :addresses, :zip_code
    add_index :addresses, :name
  end

  def self.down
    drop_table :addresses
  end
end
