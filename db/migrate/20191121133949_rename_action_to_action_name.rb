class RenameActionToActionName < ActiveRecord::Migration[6.0]
  def change
    rename_column :log_mailers, :action, :action_name
  end
end
