class CreateSectors < ActiveRecord::Migration
  def self.up
    create_table :sectors do |t|
      t.references :manager
      t.string :name, :null => false

      t.timestamps
    end

    add_index :sectors, :name, :unique => true

  end

  def self.down
    drop_table :sectors
  end
end
