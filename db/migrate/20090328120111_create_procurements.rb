class CreateProcurements < ActiveRecord::Migration
  def self.up
    create_table :procurements do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.integer :limit_cents, :value_cents
      t.timestamp :due_at

      t.timestamps
    end

    add_index :procurements, :title
    add_index :procurements, :due_at
    add_index :procurements, :created_at
  end

  def self.down
    drop_table :procurements
  end
end
