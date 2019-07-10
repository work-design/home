class Meal < ApplicationRecord
  include RailsTrade::Sell

  belongs_to :office, optional: true
  belongs_to :provider, optional: true
  has_many :buyers, through: :orders

  acts_as_list scope: [:provider_id]

  default_scope -> { order(position: :asc) }

  def today_order_items_count
    order_items.default_where(
      'created_at-gte': Date.today.at_beginning_of_day,
      'created_at-lte': Date.today.end_of_day
    ).count
  end

  def enabled?
    (Time.now < Time.now.change(hour: 16, min: 59))
  end

end
