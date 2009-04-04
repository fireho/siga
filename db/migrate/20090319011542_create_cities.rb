class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.references :country
      t.references :province
      t.string :name
      t.integer :pop

      t.timestamps
    end

    add_index :cities, :name
  end

  def self.down
    drop_table :cities
  end
end
