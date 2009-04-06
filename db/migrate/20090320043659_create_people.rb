class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.references :country
      t.string :name, :permalink, :null => false
      t.string :state, :null => false
      t.boolean :sex, :null => false, :default => false
      t.string :marital, :education
      t.string :profession, :profession_state
      t.string :prefix, :blood, :race, :limit => 5

      t.integer :revenue_cents, :age, :height, :weight

      t.references :birthplace, :mom, :dad, :spouse
      t.timestamp :born_at
      t.date :arrival_at, :leave_at

      t.timestamps
    end

    add_index :people, :name
    add_index :people, :state
    add_index :people, :sex
    add_index :people, :mom_id
    add_index :people, :dad_id
    add_index :people, :spouse_id
  end

  def self.down
    drop_table :people
  end
end
