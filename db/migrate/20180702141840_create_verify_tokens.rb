class CreateVerifyTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :verify_tokens do |t|
      t.references :user
      t.string :type, limit: 100
      t.string :token
      t.datetime :expired_at
      t.string :account
      t.integer :access_counter, default: 0
      t.timestamps
    end
  end
end
