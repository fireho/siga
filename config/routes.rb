#
# SIG@ Routing Map  2009
#
ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'home', :action => 'index'

  map.resources :laws
  map.resources :heritages
  map.resources :storages
  map.resources :calendars
  map.resources :procurements
  map.resources :registers
  map.resources :properties
  map.resources :areas
  map.resources :charters
  map.resources :groups
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
  map.resources :people
  map.resources :admin

  map.resource :user_session
  map.logout   '/logout',   :controller => 'user_sessions', :action => 'destroy'
  map.login    '/login',    :controller => 'user_sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup   '/signup',   :controller => 'users', :action => 'new'
  map.resource :account, :controller => "users"
  map.resources :accounts
  map.resources :users

end
