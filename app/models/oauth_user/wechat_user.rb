class WechatUser < OauthUser
  include RailsAuth::OauthUser::WechatUser
  include RailsWechat::OauthUser::WechatUser
  include RailsTrade::Buyer

end
