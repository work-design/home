class Stat < ApplicationRecord


  def xx(date = Date.today)
    OauthUser.default_where('created_at': date).count
    SubscribeRequest.default_where('created_at': date).count
    User.default_where('created_at': date).count
    Requirement.default_where('updated_at': date, state: ['picked','done']).count
  end

end
