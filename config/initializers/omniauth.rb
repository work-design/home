Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, CREDENT.dig(:github, :key), CREDENT.dig(:github, :secret), scope: 'user,repo,gist'
  #provider :wechat, CREDENT.dig(:wechat, :appid), CREDENT.dig(:wechat, :secret), authorize_params: { scope: 'snsapi_base' }
  provider :wechat, CREDENT.dig(:dev_wechat, :appid), CREDENT.dig(:dev_wechat, :secret), authorize_params: { scope: 'snsapi_base' }
end
