class RenameTutelagesToAgencies < ActiveRecord::Migration[6.0]
  def change
    rename_table :tutelages, :agencies
    remove_columns :agencies, :major, :tutelar_id, :pupil_id
    add_reference :agencies, :client, polymorphic: true
    add_reference :agencies, :agent, polymorphic: true
    
    rename_column :maintains, :tutelage_id, :agency_id
    rename_column :maintains, :tutelar_type, :agent_type
    rename_column :maintains, :tutelar_id, :agent_id
  end
end
