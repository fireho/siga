#
# SIG@ Routing Map  2009
#
ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'home', :action => 'index'

  map.resources :people,      :collection => { :report => :get  }
  map.resources :properties,  :collection => { :report => :get  }
  map.resources :groups,      :collection => { :report => :get  }
  map.resources :areas,       :collection => { :report => :get  }

  map.resources :messages
  map.inbox '/inbox', :controller => 'messages', :action => 'index'
  map.inbox_new '/inbox/new/:id', :controller => 'messages', :action => 'new'

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
  map.resources :attachments
  map.resources :zones
  map.resources :countries
  map.resources :provinces
  map.resources :cities
  map.resources :addresses
  map.resources :contacts
  map.resources :sectors
  map.resources :reports
  map.resources :admin
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
