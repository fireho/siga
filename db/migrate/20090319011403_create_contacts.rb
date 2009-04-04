class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.references :contactable, :polymorphic => true
      t.string :kind, :null => false,  :limit => 20
      t.string :value, :null => false, :limit => 30
      t.string :info

      t.timestamps
    end

    add_index :contacts, [:contactable_type, :contactable_id]
    add_index :contacts, :kind
  end

  def self.down
    drop_table :contacts
  end
end
