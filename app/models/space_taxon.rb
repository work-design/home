class SpaceTaxon < ApplicationRecord
  include RailsTaxon::Node
  acts_as_list
  has_many :spaces

end

# 咖啡厅
#
