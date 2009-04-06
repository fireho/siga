class CreateOfficials < ActiveRecord::Migration
  def self.up
    create_table :officials do |t|
      t.references :person
      t.timestamp :hired_at
      t.string :post

      t.timestamps
    end

    add_index :officials, :person_id
  end

  def self.down
    drop_table :officials
  end
end
