Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  config.action_controller.perform_caching = false
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }
  config.cache_store = :file_store, 'tmp/cache/store'

  config.log_level = :debug

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_options = {
    from: 'contact@one.work'
  }
  config.action_mailer.default_url_options = {
    host: 'http://localhost:3000/'
  }
  config.action_mailer.smtp_settings = {
    address: 'smtp.exmail.qq.com',
    port: 465,
    authentication: :login,
    user_name: 'contact@one.work',
    password: CREDENT[:mailer_password],
    ssl: true,
    return_response: true
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  config.active_storage.service = :upyun
  config.active_storage.logger = nil

  config.webpacker.check_yarn_integrity = true if config.respond_to?(:webpacker)
  #config.action_controller.asset_host = '7u2gfi.com1.z0.glb.clouddn.com'

  config.action_cable.disable_request_forgery_protection = true
  config.action_cable.allowed_request_origins = [
    'http://localhost:3000',
    'http://weixin.one.work'
  ]
  config.hosts += [
    '.lvh.me',
    'workdesign.free.qydev.com'
  ]

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
ActiveRecord::Base.verbose_query_logs = true
Rails.application.routes.default_url_options = {
  host: 'weixin.one.work'
}
#ActionCable.server.config.logger = Logger.new(nil)
ENV['EDITOR'] = 'code --wait'
