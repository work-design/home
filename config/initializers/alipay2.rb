Alipay2.configure do |config|
  config.appid = SETTING.dig(:alipay, :appid)
  config.target_id = '20141225xxxx'
  config.notify_url = SETTING['alipay_notify_url']
  config.oauth_url = SETTING['alipay_oauth_url']
  config.oauth_callback = SETTING['alipay_oauth_callback']
end


