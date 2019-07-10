Rails.application.configure do
  # Verifies that versions and hashed value of the package contents in the project's package.json
  
  config.hosts += [
    'one.work'
  ]
  
  config.webpacker.check_yarn_integrity = false

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false

  config.action_controller.perform_caching = true
  config.action_controller.asset_host = 'assets.one.work'

  config.public_file_server.enabled = false

  config.active_storage.service = :qiniu


  config.assets.css_compressor = :sass
  config.assets.raise_runtime_errors = false
  config.assets.compile = false
  config.assets.digest = true


  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.log_formatter = ::Logger::Formatter.new

  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify

  config.active_record.dump_schema_after_migration = false

  config.action_cable.disable_request_forgery_protection = true
  config.action_cable.allowed_request_origins = [
    'https://one.work'
  ]
end

ENV['EDITOR'] = 'vi'
