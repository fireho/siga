class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login, :kind,     :limit =>  80,   :null => false
      t.string :email,            :limit => 100
      t.string :name,             :limit => 100,   :default => ''
      t.string :state,            :null  => false, :default => 'passive'

      t.string :crypted_password, :password_salt, :null => false
      t.string :persistence_token, :single_access_token, :perishable_token,
               :current_login_ip, :last_login_ip

      t.string :time_zone, :locale, :limit => 50, :null => false

      t.datetime :last_login_at, :last_request_at, :current_login_at
      t.integer  :login_count

      t.timestamps
    end

    add_index :users, :login, :unique => true
    add_index :users, :kind
    add_index :users, :email
    add_index :users, :persistence_token
    add_index :users, :perishable_token
    add_index :users, :single_access_token
    add_index :users, :last_request_at
  end


  def self.down
    drop_table :users
  end
end
