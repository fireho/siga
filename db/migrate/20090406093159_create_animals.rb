class CreateAnimals < ActiveRecord::Migration
  def self.up
    create_table :animals do |t|
      t.references :person
      t.string :name
      t.datetime :born_at
      t.integer :age
      t.boolean :sex
      t.string :kind, :fur, :race

      t.timestamps
    end

    add_index :animals, :person_id
    add_index :animals, :kind
  end

  def self.down
    drop_table :animals
  end
end
