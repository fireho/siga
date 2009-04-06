class CreateStorages < ActiveRecord::Migration
  def self.up
    create_table :storages do |t|
      t.string :name
      t.string :amount
      t.string :unit
      t.integer :value_cents

      t.timestamps
    end

    add_index :storages, :name
  end

  def self.down
    drop_table :storages
  end
end
