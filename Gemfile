source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '6.0.0'
gem 'zeitwerk'
gem 'puma'
gem 'rack'
gem 'sidekiq'

# Third Part
gem 'octokit'
gem 'omniauth-github'
gem 'omniauth-wechat-oauth2', github: 'qinmingyuan/omniauth-wechat-oauth2'
gem 'wx_pay', github: 'jasl/wx_pay'

# Store
gem 'pg'
gem 'redis'
gem 'dalli'

# Assets
gem 'turbolinks'
gem 'sassc-rails'
gem 'webpacker', require: File.exist?('config/webpacker.yml')
gem 'sprockets', '4.0.0.beta10'

# Views
gem 'jbuilder'
gem 'kramdown'

# Utils
gem 'bcrypt'
gem 'kaminari'
gem 'acts_as_list', github: 'qinmingyuan/acts_as_list'
gem 'closure_tree', github: 'qinmingyuan/closure_tree'
gem 'rucaptcha'
gem 'mini_magick'
gem 'rqrcode'
gem 'alipay2', github: 'qinmingyuan/alipay2'
#gem 'chartkick'
#gem 'groupdate'

# Files & Data
gem 'qiniu'
gem 'roo'
gem 'qiniu_rails', github: 'qinmingyuan/qiniu_rails'

gem 'paypal-sdk-core', '0.3.4'
gem 'paypal-sdk-rest', '1.6.0'

# Rails Helpers
gem 'default_form', github: 'qinmingyuan/default_form'
gem 'default_where', github: 'qinmingyuan/default_where'

# Engines
gem 'rails_com', github: 'work-design/rails_com'
gem 'rails_crm', github: 'work-design/rails_crm'
gem 'rails_log', github: 'work-design/rails_log'
gem 'rails_org', github: 'work-design/rails_org'
gem 'rails_vip', github: 'work-design/rails_vip'
gem 'rails_auth', github: 'work-design/rails_auth'
gem 'rails_data', github: 'work-design/rails_data'
gem 'rails_role', github: 'work-design/rails_role'
gem 'rails_audit', github: 'work-design/rails_audit'
gem 'rails_bench', github: 'work-design/rails_bench'
gem 'rails_event', github: 'work-design/rails_event'
gem 'rails_trade', github: 'work-design/rails_trade'
gem 'rails_taxon', github: 'work-design/rails_taxon'
gem 'rails_detail', github: 'work-design/rails_detail'
gem 'rails_notice', github: 'work-design/rails_notice'
gem 'rails_wechat', github: 'work-design/rails_wechat'
gem 'rails_factory', github: 'work-design/rails_factory'
gem 'rails_profile', github: 'work-design/rails_profile'

# Debug
gem 'awesome_print'
gem 'pry-rails'

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

