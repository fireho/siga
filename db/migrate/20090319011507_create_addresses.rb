class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.references :city, :null => false
      t.references :zone
      t.string :street, :complement, :number, :zip_code
      t.point :geom, :srid => 4326

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
    add_index :addresses, :addressable_type
    add_index :addresses, :city_id
    add_index :addresses, :geom, :spatial => true
    add_index :addresses, :zip_code
    add_index :addresses, :street
  end

  def self.down
    drop_table :addresses
  end
end
