class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string :relatorio, :limit => 100
      t.string :caminho, :limit => 160
      t.string :usuario, :limit => 5
      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
