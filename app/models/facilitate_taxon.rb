class FacilitateTaxon < ApplicationRecord
  attribute :name, :string
  attribute :position, :integer
  attribute :facilitates_count, :integer, default: 0

  belongs_to :organ, optional: true
  has_many :facilitates, dependent: :nullify

  default_scope -> { order(position: :asc, id: :asc) }

  acts_as_list
end
