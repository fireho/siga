class CreatePersonImpairments < ActiveRecord::Migration
  def self.up
    create_table :person_impairments do |t|
      t.references :person
      t.string :kind
      t.timestamp :start_at
      t.text :info

      t.timestamps
    end

    add_index :person_impairments, :person_id
  end

  def self.down
    drop_table :person_impairments
  end
end
