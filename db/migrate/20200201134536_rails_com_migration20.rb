class RailsComMigration20 < ActiveRecord::Migration[6.0]

  def change








    create_table :escorts do |t|
      t.references :user
      t.references :volunteer
      t.string :from_name
      t.string :from_mobile
      t.string :from_address
      t.string :to_name
      t.string :to_mobile
      t.string :to_address
      t.string :goods
      t.string :car
      t.string :note
      t.string :state, default: "init"
      t.timestamps
    end






































































































































































  end

end
