class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.references :user
      t.string :title
      t.string :kind
      t.text :body
      t.timestamp :start_at, :end_at
      t.boolean :published

      t.timestamps
    end

    add_index :ads, :published
    add_index :ads, :start_at
  end

  def self.down
    drop_table :ads
  end
end
