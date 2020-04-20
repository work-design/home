require_relative 'boot'
require 'rails_com/all'

Bundler.require(*Rails.groups)

module OneWork
  class Application < Rails::Application
    config.load_defaults 6.0

    config.paths['config/routes.rb'].concat Dir[Rails.root.join('config/routes/*.rb')]
    config.autoload_paths += Dir[
      "#{config.root}/app/models/oauth_user",
      "#{config.root}/app/models/provider"
    ]

    config.time_zone = 'Beijing'
    config.ssl_options = { hsts: { subdomains: true } }
    config.i18n.default_locale = :zh

    config.generators do |g|
      g.stylesheets false
      g.javasricpts false
      g.javascript_engine false
      g.helper false
      g.jbuilder true
      g.fixture_replacement :factory_bot
    end

    config.active_record.belongs_to_required_by_default = true
    config.action_controller.forgery_protection_origin_check = true
    config.action_controller.per_form_csrf_tokens = true

    config.action_view.form_with_generates_remote_forms = true

    config.middleware.delete ActionDispatch::RequestId # 记录X-Request-Id（方便查看请求在群集中的哪台执行）

    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      html_tag
    end

    console do
      require 'pry'
      config.console = Pry
    end

  end
end
CREDENT = Rails.application.credentials.dig(Rails.env.to_sym)
ENV['EDITOR'] = 'code --wait'
