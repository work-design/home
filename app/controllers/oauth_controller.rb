class OauthController < ApplicationController
  skip_before_action :verify_authenticity_token

  def alipay
    result = Alipay::Service.open_auth_token_app(code: params[:app_auth_code])
    result = JSON.parse result
    result = result['alipay_open_auth_token_app_response']

    if result['code'] == '10000'
      @oauth_user = OauthUser.find_or_initialize_by(type: 'AlipayUser', uid: result['user_id'])
      @oauth_user.assign_attributes provider: 'alipay', app_auth_token: result['app_auth_token'], app_refresh_token: result['app_refresh_token']
      @oauth_user.user = User.first
      @oauth_user.save
    end
    #result = Alipay::Service.system_oauth_token({}, { grant_type: 'authorization_code', code: params[:app_auth_code] })
    #
    # app_refresh_token
  end

end
