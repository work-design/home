Alipay2.configure do |config|
  config.appid = CREDENT.dig(:alipay, :appid)
  config.target_id = '20141225xxxx'
  config.notify_url = CREDENT.dig(:alipay, :alipay_notify_url)
  config.oauth_url = CREDENT.dig(:alipay, :alipay_oauth_url)
  config.oauth_callback = CREDENT.dig(:alipay, :alipay_oauth_callback)
end


