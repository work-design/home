RailsLog.configure do |config|
  config.disable_debug = false
  config.notify_bot = 'WorkWechatBot'
  config.notify_key = "#{Rails.application.credentials[:log_bot_key]}"
end
