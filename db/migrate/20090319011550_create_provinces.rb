class CreateProvinces < ActiveRecord::Migration
  def self.up
    create_table :provinces do |t|
      t.references :country
      t.string :name, :null => false
      t.string :abbr, :limit => 3

      t.timestamps
    end

    add_index :provinces, :name, :unique => true
    add_index :provinces, :abbr, :unique => true
  end

  def self.down
    drop_table :provinces
  end
end
