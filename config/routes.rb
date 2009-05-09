# -*- coding: utf-8 -*-
#
#   SIGA Routing Map
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
ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'home', :action => 'index'

  map.resources :people,      :collection => { :report => :get  }
  map.resources :families,    :collection => { :report => :get  }
  map.resources :properties,  :collection => { :report => :get  }
  map.resources :groups,      :collection => { :report => :get  }
  map.resources :areas,       :collection => { :report => :get  }

  map.resources :messages
  map.inbox '/inbox', :controller => 'messages', :action => 'index'
  map.inbox_new '/inbox/new/:id', :controller => 'messages', :action => 'new'

  map.resources :pois
  map.resources :bills
  map.resources :receipts
  map.resources :services
  map.resources :ads
  map.resources :professions
  map.resources :animals
  map.resources :officials
  map.resources :laws
  map.resources :articles
  map.resources :heritages
  map.resources :storages
  map.resources :calendars
  map.resources :procurements
  map.resources :registers
  map.resources :charters
  map.resources :documents
  map.resources :publications
  map.resources :medias
  map.resources :zones
  map.resources :countries
  map.resources :provinces
  map.resources :cities
  map.resources :addresses
  map.resources :contacts
  map.resources :sectors
  map.resources :reports
  map.resources :admin, :only => [:index, :update]
  map.resources :backup, :only => [:index, :new, :show, :destroy, :create, :restore]
  map.resource  :config, :controller => "config"
  map.resource  :about, :controller => "about"
  map.resource  :help, :controller => "help"
  map.resource  :opt, :controller => "opt"

  map.resource :user_session
  map.logout   '/logout',   :controller => 'user_sessions', :action => 'destroy'
  map.login    '/login',    :controller => 'user_sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup   '/signup',   :controller => 'users', :action => 'new'
  map.resource :account, :controller => "users"
  map.resources :accounts
  map.resources :users

end
