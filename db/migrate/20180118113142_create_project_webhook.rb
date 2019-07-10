class CreateProjectWebhook < ActiveRecord::Migration[5.2]
  def change
    create_table :project_webhooks do |t|
      t.references :project
      t.json :origin_data
      t.json :valuable_data
      t.timestamps
    end
  end
end
