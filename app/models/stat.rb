class Stat < ApplicationRecord
  attribute :date, :date
  attribute :subscribed_requests_count, :integer
  attribute :oauth_users_count, :integer
  attribute :users_count, :integer
  attribute :requirements_count, :integer


  def compute(day = Date.today)
    self.date ||= day
    begin_time = date.beginning_of_day
    end_time = (date + 1).beginning_of_day
    self.oauth_users_count = OauthUser.default_where('created_at-gte': begin_time, 'created_at-lt': end_time).count
    self.subscribed_requests_count = SubscribeRequest.default_where('created_at-gte': begin_time, 'created_at-lt': end_time).count
    self.users_count = User.default_where('created_at-gte': begin_time, 'created_at-lt': end_time).count
    self.requirements_count = Requirement.default_where('created_at-gte': begin_time, 'created_at-lt': end_time).count
    self
  end

end
