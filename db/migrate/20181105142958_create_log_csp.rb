class CreateLogCsp < ActiveRecord::Migration[5.2]
  def change

    create_table :log_csps do |t|
      t.string :document_uri
      t.string :referrer
      t.string :violated_directive
      t.string :effective_directive
      t.string :original_policy, limit: 1024
      t.string :disposition
      t.string :blocked_uri
      t.string :line_number
      t.string :column_number
      t.string :source_file
      t.string :status_code
      t.string :script_sample
      t.timestamps
    end

  end
end
