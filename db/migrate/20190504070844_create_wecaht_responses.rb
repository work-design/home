class CreateWecahtResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :wechat_responses do |t|
      t.references :wechat_config
      t.string :regexp
      t.string :response
      t.timestamps
    end

  end
end
