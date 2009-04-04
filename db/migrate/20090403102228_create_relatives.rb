class CreateRelatives < ActiveRecord::Migration
  def self.up
    create_table :relatives do |t|
      t.references :person
      t.references :other
      t.string :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :relatives
  end
end
