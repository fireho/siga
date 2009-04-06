class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :name
      t.string :kind
      t.integer :value_cents
      t.timestamp :start_at, :end_at
      t.boolean :done

      t.timestamps
    end

    add_index :services, :done
    add_index :services, :kind
  end

  def self.down
    drop_table :services
  end
end
