class CreateOpts < ActiveRecord::Migration
  def self.up
    create_table :opts do |t|
      t.string :key
      t.string :value

      t.timestamps
    end

    add_index :opts, :key, :unique => true
  end

  def self.down
    drop_table :opts
  end
end
