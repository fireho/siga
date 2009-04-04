class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.string :official_name
      t.string :kind
      t.date :creation

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
