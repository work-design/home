Rails.application.configure do

  config.cache_classes = true
  config.eager_load = true

  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  #config.action_controller.asset_host = 'assets.yigexiangfa.com'

  config.public_file_server.enabled = true

  config.webpacker.check_yarn_integrity = false if config.respond_to?(:webpacker)

  config.active_storage.service = :qiniu
  config.active_storage.logger = nil

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

Rails.application.routes.default_url_options = {
  host: 'one.work'
}

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/2' }
end

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379/2' }
end

ENV['EDITOR'] = 'vi'
