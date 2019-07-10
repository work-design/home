class Facilitate < ApplicationRecord
  include RailsTrade::Sell
  include RailsFactory::Good

  attribute :quantity, :integer, default: 1
  attribute :unified_quantity, :integer, default: 1
  attribute :unit, :string, default: '个'

  belongs_to :facilitate_taxon, autosave: true, counter_cache: true
  has_one :good_provider, -> { where(selected: true) }, as: :good
  has_one :provider, through: :good_provider
  has_many :good_providers, as: :good
  has_many :providers, through: :good_providers

  has_many :products

  has_one_attached :logo

end
