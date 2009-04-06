class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.references :user
      t.string :kind
      t.string :title
      t.text :body
      t.integer :value_cents

      t.timestamps
    end

    add_index :bills, :user_id
  end

  def self.down
    drop_table :bills
  end
end
