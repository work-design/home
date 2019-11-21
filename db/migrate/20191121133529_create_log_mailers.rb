class CreateLogMailers < ActiveRecord::Migration[6.0]
  def change
    create_table :log_mailers do |t|
      t.string :message_object_id
      t.string :mailer
      t.string :action
      t.string :params
      t.string :subject
      t.string :mail_to
      t.string :cc_to
      t.string :sent_status
      t.string :sent_string
      t.timestamps
    end
    
    rename_column :log_records, :controller, :controller_name
    rename_column :log_records, :action, :action_name
  end
end
