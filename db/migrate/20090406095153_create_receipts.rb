class CreateReceipts < ActiveRecord::Migration
  def self.up
    create_table :receipts do |t|
      t.string :kind
      t.string :title
      t.text :body
      t.integer :value_cents

      t.timestamps
    end
  end

  def self.down
    drop_table :receipts
  end
end
