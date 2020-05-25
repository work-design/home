Alipay2.configure do |config|
  config.sandbox = true if Rails.env.development?
  config.appid = Rails.application.credentials.dig(:alipay, :appid)
  config.target_id = '20141225xxxx'
  config.notify_url = Rails.application.credentials.dig(:alipay, :alipay_notify_url)
  config.oauth_url = Rails.application.credentials.dig(:alipay, :alipay_oauth_url)
  config.oauth_callback = Rails.application.credentials.dig(:alipay, :alipay_oauth_callback)
end
