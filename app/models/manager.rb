class Manager < ApplicationRecord
  include RailsRole::User
  #serialize :team_id, Array

  belongs_to :user, optional: true
  belongs_to :leader, class_name: 'Manager', inverse_of: :followers, optional: true
  has_many :followers, class_name: 'Manager', foreign_key: :leader_id, inverse_of: :leader, dependent: :nullify
  validates :user_id, uniqueness: true, allow_blank: true


  def director?
    leader_id.nil?
  end

  def descendant_ids(c_ids = follower_ids)
    @descendant_ids ||= c_ids.dup
    get_ids = Manager.where(leader_id: c_ids).pluck(:id).flatten
    if get_ids.present?
      @descendant_ids.concat get_ids
      descendant_ids(get_ids)
    else
      @descendant_ids
    end
  end

  def followers
    self.class.where(id: descendant_ids)
  end

  def self_and_followers
    self.class.where(id: descendant_ids + [self.id])
  end

  def allow_ids
    if leader_id.nil?
      descendant_ids + [self.id, nil]
    else
      descendant_ids + [self.id]
    end
  end

end
