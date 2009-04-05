class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.references :documentable, :polymorphic => true, :null => false
      t.string :kind, :null => false, :limit => 10
      t.string :value, :null => false
      t.string :extra, :note, :state, :emitter
      t.date :emit_at, :invalid_at

      t.timestamps
    end

    add_index :documents, [:documentable_type, :documentable_id]
    add_index :documents, :documentable_type
    add_index :documents, :kind
    add_index :documents, :state
  end

  def self.down
    drop_table :documents
  end
end
