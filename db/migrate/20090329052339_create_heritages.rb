class CreateHeritages < ActiveRecord::Migration
  def self.up
    create_table :heritages do |t|
      t.references :property
      t.string :name, :code
      t.string :down_kind, :state
      t.integer :value_cents, :sold_cents
      t.text :info

      t.date :bought_at, :down_at
      t.timestamps
    end
  end

  def self.down
    drop_table :heritages
  end
end
