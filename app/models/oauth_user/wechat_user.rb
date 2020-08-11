class WechatUser < OauthUser
  include RailsWechat::OauthUser::WechatUser
  include RailsTrade::Buyer

end
