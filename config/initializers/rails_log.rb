RailsLog.configure do |config|
  config.disable_debug = false
  config.notify_bot = 'WorkWechatBot'
  config.notify_key = "#{CREDENT[:log_bot_key]}"
end
