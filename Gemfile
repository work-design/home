source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '6.1.0.rc1'
gem 'puma'
gem 'sidekiq'

# Store
gem 'pg'
gem 'redis'
gem 'dalli'

# Assets
gem 'turbolinks'
gem 'webpacker', require: File.exist?('config/webpacker.yml')

# Views
gem 'jbuilder'
gem 'kramdown'

# Utils
gem 'bcrypt'
gem 'kaminari'
gem 'acts_as_list'
gem 'rucaptcha'
gem 'image_processing'
gem 'rqrcode'

# Third party
gem 'octokit'
gem 'omniauth-github'
gem 'omniauth-wechat-oauth2', github: 'qinmingyuan/omniauth-wechat-oauth2'

# Payment method
gem 'wx_pay', github: 'jasl/wx_pay'
gem 'alipay2', github: 'qinmingyuan/alipay2'
gem 'paypal-sdk-core'
gem 'paypal-sdk-rest'

# Files
gem 'upyun_rails', github: 'qinmingyuan/upyun_rails'

# Rails Helpers
gem 'default_form', github: 'qinmingyuan/default_form'
gem 'default_where', github: 'qinmingyuan/default_where'

# Engines
gem 'rails_com', github: 'work-design/rails_com'
gem 'rails_log', github: 'work-design/rails_log'
gem 'rails_org', github: 'work-design/rails_org'
gem 'rails_vip', github: 'work-design/rails_vip'
gem 'rails_auth', github: 'work-design/rails_auth'
gem 'rails_data', github: 'work-design/rails_data'
gem 'rails_quip', github: 'work-design/rails_quip'
gem 'rails_role', github: 'work-design/rails_role'
gem 'rails_audit', github: 'work-design/rails_audit'
gem 'rails_bench', github: 'work-design/rails_bench'
gem 'rails_event', github: 'work-design/rails_event'
gem 'rails_trade', github: 'work-design/rails_trade'
gem 'rails_agency', github: 'work-design/rails_agency'
gem 'rails_attend', github: 'work-design/rails_attend'
gem 'rails_detail', github: 'work-design/rails_detail'
gem 'rails_growth', github: 'work-design/rails_growth'
gem 'rails_notice', github: 'work-design/rails_notice'
gem 'rails_wechat', github: 'work-design/rails_wechat'
gem 'rails_finance', github: 'work-design/rails_finance'
gem 'rails_profile', github: 'work-design/rails_profile'
gem 'rails_interact', github: 'work-design/rails_interact'

# Debug
gem 'pry-rails'
gem 'amazing_print'

group :development, :test do
  gem 'byebug'
  gem 'pry-stack_explorer'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'listen'
end

group :production, :staging do
end
gem 'bootsnap', '>= 1.1.0', require: false

