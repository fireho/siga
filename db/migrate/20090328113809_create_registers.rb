class CreateRegisters < ActiveRecord::Migration
  def self.up
    create_table :registers do |t|
      t.references :registrable, :polymorphic => true
      t.string :name
      t.integer :value_cents, :null => false, :default => 0
      t.boolean :sign, :null => false, :default => false
      t.timestamp :due_at
      t.timestamp :cleared_at

      t.timestamps
    end

    add_index :registers, [:registrable_type, :registrable_id]
    add_index :registers, :value_cents
    add_index :registers, :due_at
    add_index :registers, :cleared_at
    add_index :registers, :sign
  end

  def self.down
    drop_table :registers
  end
end
