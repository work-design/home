class ChangeFocusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :tasks, :focus, 0
  end
end
