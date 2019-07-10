class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.references :user
      t.references :area
      t.string :type
      t.string :name
      t.string :service_tel
      t.string :service_qq
      t.string :address
      t.timestamps
    end
  end
end


