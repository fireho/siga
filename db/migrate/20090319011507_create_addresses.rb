class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.references :city
      t.string :street
      t.string :complement
      t.string :number
      t.string :zip_code

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
    add_index :addresses, :city_id
  end

  def self.down
    drop_table :addresses
  end
end
