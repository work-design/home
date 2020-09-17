class User < ApplicationRecord
  include RailsBench::User
  include RailsRole::User
  include RailsAuth::User
  include RailsTrade::User
  include RailsNotice::User
  include RailsWechat::User
  include RailsOrg::User
  include RailsProfile::User
  include RailsAgency::User

  has_one :wechat_user
  has_many :project_funds, dependent: :nullify

  has_many :requirements, dependent: :destroy
  has_many :picked_requirements, class_name: 'Requirement', foreign_key: :volunteer_id
  has_many :escorts, dependent: :destroy
  has_many :picked_escorts, class_name: 'Escort', foreign_key: :volunteer_id

  def duty_options
    Duty.where.not(id: workers.pluck(:duty_id)).select(:id, :name).map { |i| [i.name, i.id] }
  end


end

