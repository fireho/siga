class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :from_id, :to_id, :null => false
      t.references :parent

      t.string :subject, :null => false
      t.text :body, :null => false
      t.boolean :read, :default => false, :null => false

      t.timestamps
    end

    add_index :messages, :from_id
    add_index :messages, :parent_id
    add_index :messages, :read
    add_index :messages, :to_id
  end

  def self.down
    drop_table :messages
  end
end
