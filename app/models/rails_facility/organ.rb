module RailsFacility::Organ
  extend ActiveSupport::Concern
  included do
    has_many :spaces
    has_many :workers
  end
  
end


