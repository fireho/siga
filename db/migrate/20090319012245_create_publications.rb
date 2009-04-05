class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.references :user
      t.string :title, :permalink, :null => false
      t.boolean :published, :null => false, :default => false
      t.timestamp :published_at
      t.text :body

      t.timestamps
    end

    add_index :publications, :permalink
    add_index :publications, :created_at
    add_index :publications, :published
    add_index :publications, :user_id
  end

  def self.down
    drop_table :publications
  end
end
