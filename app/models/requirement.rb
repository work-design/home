class Requirement < ApplicationRecord
  attribute :name, :string
  attribute :from, :string
  attribute :to, :string
  attribute :pick_on, :date
  attribute :pick_at, :time
  attribute :note, :string
  attribute :state, :string, default: 'init'

  belongs_to :user
  belongs_to :volunteer, class_name: 'User', optional: true
  belongs_to :from_area, class_name: 'Area', optional: true
  belongs_to :to_area, class_name: 'Area', optional: true
  has_many :accounts, through: :user

  has_one_attached :credential

  enum state: {
    init: 'init',
    unverified: 'unverified',
    picked: 'picked',
    done: 'done'
  }

  after_save_commit :to_notice, if: -> { saved_change_to_volunteer_id? && volunteer }
  acts_as_notify(
    :default,
    only: [:name, :from, :to, :note],
    methods: [:title, :service_type, :service_content, :volunteer_name, :volunteer_mobile, :remark]
  )

  def title
    '尊敬的医护人员您好，您的用车需求已有志愿者接单'
  end

  def service_type
    '武汉医护人员志愿者接送服务'
  end

  def service_content
    "#{from} - #{to}"
  end

  def volunteer_name
    volunteer.name
  end

  def volunteer_mobile
    volunteer.account_identities.join(',')
  end

  def remark
    '点击此处查看详细信息'
  end

  def from_address
    [from_area&.full_name, from].compact.join(' ')
  end

  def to_address
    [to_area&.full_name, to].compact.join(' ')
  end

  def mobile
    user.accounts.where(type: 'MobileAccount').pluck(:identity).join(',')
  end

  def mobile_public
    "#{'*' * 7 }#{mobile[-4..-1]}"
  end

  def to_notice
    to_notification(
      receiver: user,
      title: '有人来护送天使了',
      body: '有人已接单',
      link: url_helpers.my_requirement_url(id),
      verbose: true
    )
  end

end
