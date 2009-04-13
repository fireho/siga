class CreateHolders < ActiveRecord::Migration
  def self.up
    create_table :holders do |t|
      t.references :group, :person

      t.timestamps
    end
  end

  def self.down
    drop_table :holders
  end
end
