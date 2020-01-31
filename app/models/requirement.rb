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

  has_one_attached :credential

  enum state: {
    init: 'init',
    picked: 'picked',
    done: 'done'
  }

  after_save_commit :to_notice, if: -> { saved_change_to_volunteer_id? }
  acts_as_notify(
    :default,
    only: [:name, :from, :to, :note],
    methods: [:mobile]
  )

  def title
    '尊敬的医护人员您好，您的用车需求已有志愿者接单'
  end

  def volunteer_name
    volunteer.name
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
      body: "有人已接单",
      verbose: true
    )
  end

end
