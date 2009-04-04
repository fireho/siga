class CreateProcurements < ActiveRecord::Migration
  def self.up
    create_table :procurements do |t|
      t.string :name, :null => false
      t.text :body, :null => false
      t.timestamp :due_at

      t.timestamps
    end

    add_index :procurements, :name
    add_index :procurements, :due_at
    add_index :procurements, :created_at
  end

  def self.down
    drop_table :procurements
  end
end
