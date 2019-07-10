class GithubUser < OauthUser
  attribute :provider, :string, default: 'github'

  def save_info(oauth_params)
    info_params = oauth_params.fetch('info', {})
    cred_params = oauth_params.fetch('credentials', {})

    self.name = info_params['name']
    self.access_token = cred_params['token']
    self.save
  end


  def client
    @client ||= Octokit::Client.new access_token: self.access_token
  end

  def issues
  end


end
