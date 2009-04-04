# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_siga_prefeitura_session',
  :secret      => '62f58855687391307607900a7487d7bb5418bcc435192580034d24c57afaee49fb5e67312926ea46ebb9522d3fbf674a28e77077be4f2faa74733cd41ad3f994'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
