class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name, :null => false
      t.string :abbr, :limit => 3

      t.timestamps
    end

    add_index :countries, :name, :unique => true
    add_index :countries, :abbr, :unique => true
  end

  def self.down
    drop_table :countries
  end
end
