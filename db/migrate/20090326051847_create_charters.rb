class CreateCharters < ActiveRecord::Migration
  def self.up
    create_table :charters do |t|
      t.string :code
      t.text :restrictions

      t.timestamps
    end
  end

  def self.down
    drop_table :charters
  end
end
