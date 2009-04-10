#
# SIG@ DATABASE RECIPES
#
namespace :db do

  #
  # VALIDATES MODELS
  #
  #base: http://blog.hasmanythrough.com/2006/8/27/validate-all-your-records
  #task: rake db:validate_models
  def all_models
    #get all active record classes
    Dir.glob(RAILS_ROOT + '/app/models/**/*.rb').each do |file|
      begin
        require file unless file =~ /observer/
      rescue
        #require any possible file dependencies
        if $!.to_s =~ /^uninitialized constant (\w+)$/
          require $1.underscore + '.rb'
          retry
        else
          raise
        end
      end
    end
    klasses = Object.subclasses_of(ActiveRecord::Base)
    #throw out session if it is not stored in db
    klasses.reject! do |klass|
      klass == CGI::Session::ActiveRecordStore::Session && ActionController::Base.session_store.to_s !~ /ActiveRecordStore/
    end
    klasses.select{ |c| c.base_class == c}.sort_by(&:name)
  end

  def validate_models
    #validate them
    puts "-- records - model --"
    all_models.each do |klass|
      begin
        total = klass.count
      rescue
        #tableless, session...
        if $!.to_s =~ /Table .* doesn't exist/im
          puts "No Table for: #{klass}"
          next
        end
        raise
      end
      printf "%10dx %s\n", total, klass.name
      chunk_size = 1000
      (total / chunk_size + 1).times do |i|
        chunk = klass.find(:all, :offset => (i * chunk_size), :limit => chunk_size)
        chunk.reject(&:valid?).each do |record|
          puts "#{record.class}: id=#{record.id}"
          p record.errors.full_messages
          puts
        end rescue nil
      end
    end
  end

  desc "Run model validations on all model records in database"
  task :validate_models => :environment do
    validate_models
  end

  #
  # REMIGRATE
  desc "Migrate schema to version 0 and back up again. DESTROYS all data in tables!!"
  task :remigrate => :environment do
    require 'highline/import'
    if ENV['OVERWRITE'].to_s.downcase == 'true' or agree("This task will destroy any data in the database. Are you sure you want to \ncontinue? [yn] ")

      # Migrate downward
      ActiveRecord::Migrator.migrate("#{RAILS_ROOT}/db/migrate/", 0)

      # Migrate upward
      Rake::Task["db:migrate"].invoke

      # Dump the schema
      Rake::Task["db:schema:dump"].invoke
    else
      say "Task cancelled."
      exit
    end
  end

  #
  # BACKUP DB
  desc "Backup db to tmp"
  task :backup do
    require 'yaml'

    env   = ENV['RAILS_ENV'] || ENV['DB'] || 'production'
    db_config = YAML.load_file("config/database.yml")
    db_user = db_config[env]["username"]
    db_pass = db_config[env]["password"]
    db_host = db_config[env]["hostname"] || "localhost"
    db_name = db_config[env]["database"]

    #base_path = ENV["DIR"] || "db"
    datestamp = Time.now.strftime("%Y%m%d%H%M%S")
    file  = "siga_#{env}-#{datestamp}.sql.bz2"

    cmd = "pg_dump --clean --no-owner --no-privileges -U#{db_user} -h#{db_host} #{db_name}"
    cmd += " -p#{db_pass}" if db_pass
    cmd += " | bzip2 > tmp/#{file}"
    puts "Dump Start => tmp/#{file}"
    t = Time.now
    result =  system cmd
    raise("database dump failed.  msg: #{$?}") unless result
    puts "Done. (#{Time.now - t}s)"
  end

  #
  # BOOTSTRAP DB
  desc "Loads db with fake data"
  task :bootstrap do
    require 'object_daddy'
    require 'faker'
    [Publication, Article, Person, Group, Law, Area, Procurement, Poi,
    User, Official, Sector, Zone, Property].each do |k|
      80.times {  k.generate! }
    end
  end

  #
  # SHORTCUT MIGRATE DEV ENV
  #
  namespace :migrate do
    desc "Migrates development and test databases"
    task :dev do
      puts "Migrating development database"
      Rake::Task["db:migrate"].invoke

      puts "Migrating test database"
      Rake::Task["db:test:clone"].invoke
      puts "Test migration complete"
    end
  end
end
