class ChangeRefundState < ActiveRecord::Migration[6.0]
  def change
    change_column :refunds, :state, :string
  end
end
