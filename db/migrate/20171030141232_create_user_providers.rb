class CreateUserProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :user_providers do |t|
      t.references :user
      t.references :provider
      t.timestamps
    end
  end
end
