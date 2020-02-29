class RailsComMigration29 < ActiveRecord::Migration[6.0]

  def change






















    add_column :users, :invited_code, :string
    remove_column :users, :invite_token, :string









































    remove_column :aim_entities, :aim_user_id, :integer, scale: 8
    remove_column :aim_entities, :reward_id, :integer, scale: 8


    remove_column :reward_expenses, :coin_id, :integer, scale: 8



    remove_column :aim_logs, :aim_entity_id, :integer, scale: 8
    remove_column :aim_logs, :reward_id, :integer, scale: 8




    remove_column :praise_incomes, :praise_user_id, :integer, scale: 8



















































































































  end

end