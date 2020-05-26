Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.credentials.dig(:github, :key), Rails.application.credentials.dig(:github, :secret), scope: 'user,repo,gist'
  if ENV['DEV_WECHAT']
    provider :wechat, Rails.application.credentials.dig(:dev_wechat, :appid), Rails.application.credentials.dig(:dev_wechat, :secret), authorize_params: { scope: 'snsapi_userinfo' }
  else
    provider :wechat, Rails.application.credentials.dig(:wechat, :appid), Rails.application.credentials.dig(:wechat, :secret), authorize_params: { scope: 'snsapi_userinfo' }
  end
end
