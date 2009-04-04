class CreateLaws < ActiveRecord::Migration
  def self.up
    create_table :laws do |t|
      t.references :user
      #Nested Set
      t.integer :parent_id, :lft, :rgt
      t.text :content
      t.datetime :wrote_at, :valid_at, :expire_at

      t.timestamps
    end

    #TODO: nested set indexes?!
    add_index :laws, :user_id
    add_index :laws, :parent_id
    add_index :laws, :wrote_at
  end

  def self.down
    drop_table :laws
  end
end
