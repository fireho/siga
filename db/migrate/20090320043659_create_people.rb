class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name, :null => false
      t.string :state, :null => false
      t.boolean :sex, :null => false, :default => false
      t.string :marital, :education, :profession, :house_type, :blood

      t.integer :revenue_cents, :income_cents, :rooms

      t.references :birthplace, :mom, :dad, :spouse
      t.date :born_at, :arrival_at

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
