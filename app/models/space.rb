class Space < ApplicationRecord
  include RailsTrade::Sell
  
  #include ItemModel
  attribute :quantity, :integer, default: 1
  attribute :unified_quantity, :integer, default: 1
  attribute :unit, :string, default: '个'
  
  belongs_to :space_taxon
  belongs_to :taxon, class_name: 'SpaceTaxon', foreign_key: :space_taxon_id
  belongs_to :area
  
  
end
