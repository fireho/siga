namespace :test do
  task :move_test_db_config do
    require 'ftools'
    File.move(RAILS_ROOT+"/config/database.yml.test", RAILS_ROOT+"/config/database.yml")
  end
end
