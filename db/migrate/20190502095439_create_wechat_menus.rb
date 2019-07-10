class CreateWechatMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :wechat_menus do |t|
      t.references :wechat_config
      t.references :parent
      t.string :type
      t.string :menu_type
      t.string :name
      t.string :value
      t.string :appid
      t.string :pagepath
      t.timestamps
    end
  end
end
