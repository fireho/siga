class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.references :user, :null => false
      t.string :title, :null => false
      t.text :body, :null => false

      t.boolean :public, :published, :default => false, :null => false

      t.timestamps
    end

    add_index :articles, :title
    add_index :articles, :created_at
    add_index :articles, :public
    add_index :articles, :published
    add_index :articles, :user_id
  end

  def self.down
    drop_table :articles
  end
end
