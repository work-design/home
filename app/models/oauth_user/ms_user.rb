class MsUser < OauthUser
  attribute :provider, :string, default: 'microsoft_v2_auth'

  def save_info(oauth_params)
    self.access_token = oauth_params.fetch('credentials', {})['token']
  end

end
