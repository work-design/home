class RailsComMigration25 < ActiveRecord::Migration[6.0]

  def change






















    remove_column :users, :provider_id, :integer, scale: 4















































    add_column :refunds, :response, :json














































    create_table :shipments do |t|
      t.references :package
      t.references :address
      t.timestamps
    end

    create_table :rally_users do |t|
      t.references :rally
      t.references :user
      t.references :inviter
      t.decimal :commission_ratio, precision: 4, scale: 2, comment: "佣金比例", default: 0
      t.string :kind
      t.timestamps
    end

    create_table :rallies do |t|
      t.references :area
      t.string :name
      t.string :detail
      t.timestamps
    end





























































  end

end
