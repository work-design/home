Rails.application.configure do
  # Verifies that versions and hashed value of the package contents in the project's package.json
  config.webpacker.check_yarn_integrity = true if config.respond_to?(:webpacker)

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  config.action_controller.perform_caching = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }
  config.cache_store = :file_store, 'tmp/cache/store'

  config.log_level = :debug

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true

  config.active_storage.service = :qiniu_dev
  config.active_storage.logger = nil

  config.assets.css_compressor = nil
  config.assets.debug = true
  config.assets.quiet = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
  #config.action_controller.asset_host = '7u2gfi.com1.z0.glb.clouddn.com'

  config.action_cable.allowed_request_origins = [
    'http://localhost:3000',
    'http://weixin.one.work'
  ]
  config.hosts += [
    'weixin.one.work',
    't.one.work'
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
ActionCable.server.config.logger = Logger.new(nil)
ENV['EDITOR'] = 'code --wait'
