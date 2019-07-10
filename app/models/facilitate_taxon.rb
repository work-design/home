class FacilitateTaxon < ApplicationRecord
  acts_as_list

  has_many :facilitates, dependent: :nullify
  default_scope -> { order(position: :asc, id: :asc) }

end


# :name, :string, limit: 255
# :type, :string, limit: 255
# :price_reduce, integer, limit: 4
# :start_at, :datetime
# :finish_at, :datetime

# 运费；
# 运费计算，基于重量；
#
#
# 保险；
# 基于总价；
#
#