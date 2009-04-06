class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.string :name
      t.integer :people_count
      t.integer :revenue_cents
      t.string :kind
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
