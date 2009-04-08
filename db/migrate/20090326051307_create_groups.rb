class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name, :official_name, :null => false
      t.string :kind, :state
      t.date :started_at, :closed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
