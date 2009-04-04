class CreateHeritages < ActiveRecord::Migration
  def self.up
    create_table :heritages do |t|
      t.string :name
      t.string :code
      t.date :bought_at
      t.integer :value_cents

      t.timestamps
    end
  end

  def self.down
    drop_table :heritages
  end
end
