Rails.application.config.middleware.use OmniAuth::Builder do
  config = Rails.application.credentials.config
  env = Rails.env.to_sym
  
  provider :developer unless Rails.env.production?
  provider :github, config.dig(env, :github, :key), config.dig(env, :github, :secret), scope: 'user,repo,gist'
  provider :wechat, config.dig(env, :wechat, :appid), config.dig(env, :wechat, :secret), authorize_params: { scope: 'snsapi_base' }
end
