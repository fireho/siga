class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.references :attachable, :polymorphic => true
      t.string     :media_file_name, :media_content_type
      t.integer    :media_file_size
      t.datetime   :media_updated_at

      t.text :info

      t.timestamps
    end

    add_index :attachments, :media_content_type
    add_index :attachments, :media_file_name
    add_index :attachments, :media_file_size
    add_index :attachments, [:attachable_id, :attachable_type]
    add_index :attachments, :created_at
  end

  def self.down
    drop_table :attachments
  end
end
