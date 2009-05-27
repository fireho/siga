config.cache_classes = true
config.whiny_nils = true
# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_loading            = true
# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false
# config.active_record.schema_format = :sql
config.action_mailer.delivery_method = :test

config.gem "rspec", :lib => false
config.gem "rspec-rails", :lib => false
config.gem "webrat", :lib => false
config.gem "cucumber", :lib => false
config.gem "nofxx-rspec_spinner", :lib => false
config.gem "carlosbrando-remarkable", :lib => false
config.gem "nofxx-object_daddy", :lib => "object_daddy"
config.gem "faker"

