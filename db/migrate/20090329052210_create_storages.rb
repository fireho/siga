class CreateStorages < ActiveRecord::Migration
  def self.up
    create_table :storages do |t|
      t.string :name
      t.string :kind, :unit
      t.decimal :amount, :precision => 15, :scale => 3
      t.integer :unit_cents
      t.integer :total_cents

      t.timestamps
    end

    add_index :storages, :name
  end

  def self.down
    drop_table :storages
  end
end
