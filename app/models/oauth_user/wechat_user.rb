class WechatUser < OauthUser
  include RailsAuth::OauthUser::WechatUser
  include RailsTrade::Buyer
  include RailsWechat::WechatUser


end
