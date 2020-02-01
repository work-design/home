class Escort < ApplicationRecord
  attribute :from_name, :string
  attribute :from_mobile, :string
  attribute :from_address, :string
  attribute :to_name, :string
  attribute :to_mobile, :string
  attribute :to_address, :string
  attribute :goods, :string
  attribute :car, :string
  attribute :note, :string
  attribute :state, :string, default: 'init'

  belongs_to :user
  belongs_to :volunteer, class_name: 'User', optional: true
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
    '您好，您的用车需求已有志愿者接单'
  end

  def service_type
    '武汉医护人员物资对接服务'
  end

  def service_content
    "#{from_name} - #{to_name}"
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

  def from_mobile_public
    "#{'*' * 7 }#{from_mobile[-4..-1]}"
  end

  def to_mobile_public
    "#{'*' * 7 }#{to_mobile[-4..-1]}"
  end

  def to_notice
    to_notification(
      receiver: user,
      title: '有人来护送物资了',
      body: '有人已接单',
      link: url_helpers.my_requirement_url(id),
      verbose: true
    )
  end

end
