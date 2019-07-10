class User < ApplicationRecord
  include RailsRole::User
  include RailsAuth::User
  include RailsTrade::Buyer
  include RailsTrade::User
  include RailsNotice::Receiver
  include RailsOrg::User
  include RailsProfile::User

  has_one :present_worker, -> { where(major: true) }, class_name: 'Worker'
  has_many :workers, -> { order(id: :asc) }
  has_many :projects, foreign_key: :creator_id, dependent: :nullify
  has_one :github_user
  has_one :wechat_user

  attribute :provider_id, :integer
  belongs_to :provider, inverse_of: :users, autosave: true, optional: true

  has_many :project_funds, dependent: :nullify
  
  def duty_options
    Duty.where.not(id: workers.pluck(:duty_id)).select(:id, :name).map { |i| [i.name, i.id] }
  end

  def github_client
    github_user.client
  end

  def github_repos(name = nil)
    if github_user && name
      github_user.client.repo(name)
    elsif github_user && name.nil?
      github_user.client.repos.map { |r| { full_name: r.full_name, private: r.private } }
    else
      []
    end
  end

end

