class RenameExpiredAtToExpireAt < ActiveRecord::Migration[6.0]
  def change
    rename_column :verify_tokens, :expired_at, :expire_at
  end
end
