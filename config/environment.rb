# -*- coding: utf-8 -*-
#
#   Copyright © 2009 Fireho
#
#   This file is part of SIGA.
#
#   SIGA is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   SIGA is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = "UTC"
  config.i18n.load_path += Dir[Rails.root.join("lib", "locales", "*.{rb,yml}")]
  config.i18n.default_locale = "pt"

  config.gem "pg" #"postgres"
  config.gem "authlogic"
  config.gem "haml-edge", :lib => "haml"
  config.gem "rghost"
  config.gem "nofxx-georuby", :lib => "geo_ruby"
  config.gem "nofxx-postgis_adapter", :lib => "postgis_adapter"
  config.gem "bcrypt-ruby", :lib => "bcrypt"
  config.gem "thoughtbot-paperclip" , :lib => "paperclip"
#  config.gem "giraffesoft-is_taggable", :lib => "is_taggable"
  config.gem "nofxx-formtastic", :lib => "formtastic"
  config.gem "nofxx-money", :lib => "money"
  config.gem "friendly_id"
  config.gem "will_paginate"

  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
end

require "will_paginate"
WillPaginate::ViewHelpers.pagination_options[:previous_label] = "&laquo; Anterior"
WillPaginate::ViewHelpers.pagination_options[:next_label] = "Próximo &raquo;"
GeoRuby::SimpleFeatures.const_set :DEFAULT_SRID, 4326
