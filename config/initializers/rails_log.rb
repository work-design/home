RailsLog.configure do |config|
  config.quiet_logs = true
  config.disable_debug = false
  config.notify_url = "https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=#{CREDENT[:wechat_bot_key]}"
end
