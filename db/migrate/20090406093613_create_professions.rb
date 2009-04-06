class CreateProfessions < ActiveRecord::Migration
  def self.up
    create_table :professions do |t|
      t.string :name
      t.string :kind
      t.integer :person_count

      t.timestamps
    end

    add_index :professions, :name
  end

  def self.down
    drop_table :professions
  end
end
