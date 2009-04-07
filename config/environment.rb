# -*- coding: utf-8 -*-
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = "UTC"
  config.i18n.load_path += Dir[Rails.root.join("lib", "locales", "*.{rb,yml}")]
  config.i18n.default_locale = "pt-BR"

  config.gem "postgres"
  config.gem "postgis_adapter"
  config.gem "authlogic"
  config.gem "haml"
  config.gem "rghost"
  config.gem "GeoRuby", :lib => "geo_ruby"
  config.gem "bcrypt-ruby", :lib => "bcrypt"
  config.gem "thoughtbot-paperclip" , :lib => "paperclip"
  config.gem "giraffesoft-is_taggable", :lib => "is_taggable"
  config.gem "justinfrench-formtastic", :lib => "formtastic"
  config.gem "nofxx-money", :lib => "money"

  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
end

require "will_paginate"
WillPaginate::ViewHelpers.pagination_options[:prev_label] = "&laquo; Anterior"
WillPaginate::ViewHelpers.pagination_options[:next_label] = "Próximo &raquo;"
GeoRuby::SimpleFeatures.const_set :DEFAULT_SRID, 4326
