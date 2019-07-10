class Provider < ApplicationRecord
  include RailsFactory::Provider
  has_many :spaces
  has_many :workers


end


