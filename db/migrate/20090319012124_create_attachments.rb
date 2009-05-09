class CreateMedias < ActiveRecord::Migration
  def self.up
    create_table :medias do |t|
      t.references :attachable, :polymorphic => true
      t.string     :media_file_name, :media_content_type
      t.integer    :media_file_size
      t.datetime   :media_updated_at

      t.text :info

      t.timestamps
    end

    add_index :medias, :media_content_type
    add_index :medias, :media_file_name
    add_index :medias, :media_file_size
    add_index :medias, [:attachable_id, :attachable_type]
    add_index :medias, :created_at
  end

  def self.down
    drop_table :medias
  end
end
