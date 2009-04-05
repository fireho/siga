# -*- coding: utf-8 -*-
# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  config.time_zone = "UTC"
  config.i18n.load_path += Dir[Rails.root.join("lib", "locales", "*.{rb,yml}")]
  config.i18n.default_locale = "pt-BR"


  config.gem "postgres"
  config.gem "postgis_adapter"
  config.gem "authlogic"
  config.gem "haml"
  config.gem "rghost"
  config.gem "bcrypt-ruby", :lib => "bcrypt"
  config.gem "thoughtbot-paperclip" , :lib => "paperclip"
  config.gem "giraffesoft-is_taggable", :lib => "is_taggable"
  config.gem "justinfrench-formtastic", :lib => "formtastic"
  config.gem "nofxx-money", :lib => "money"

  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer


end

require "will_paginate"

WillPaginate::ViewHelpers.pagination_options[:prev_label] = "<< Anterior"
WillPaginate::ViewHelpers.pagination_options[:next_label] = "Próximo >>"
