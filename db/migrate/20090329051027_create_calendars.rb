class CreateCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.date :day
      t.boolean :business
      t.boolean :yearly
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :calendars
  end
end
