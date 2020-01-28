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

  def mobile
    user.accounts.where(type: 'MobileAccount').pluck(:identity).join(',')
  end

  def mobile_public
    "#{'*' * 7 }#{mobile[-4..-1]}"
  end

end
