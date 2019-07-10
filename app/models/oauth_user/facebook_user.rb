class FacebookUser < OauthUser
  attribute :provider, :string, default: 'facebook'

  def save_info(oauth_params)
    self.name = oauth_params['name']
  end

  def avatar_url
    if super
      super
    else
      "http://graph.facebook.com/#{uid}/picture?type=large"
    end
  end


  def stray
    OmniAuth::Strategies::Facebook.new nil, 'abc', 'efg', access_token: ''
  end

end
