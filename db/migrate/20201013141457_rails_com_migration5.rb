class RailsComMigration5 < ActiveRecord::Migration[6.1]

  def change


























    create_table :fund_incomes do |t|
      t.references :fund
      t.references :user
      t.references :financial, polymorphic: true
      t.string :name
      t.boolean :visible
      t.decimal :amount
      t.timestamps
    end

    create_table :fund_uses do |t|
      t.references :fund
      t.references :financial, polymorphic: true
      t.decimal :budget_amount
      t.decimal :amount, default: 0
      t.string :note
      t.timestamps
    end


    rename_column :budgets, :budgeting_type, :financial_type
    rename_column :budgets, :budgeting_id, :financial_id


    create_table :funds do |t|
      t.string :name
      t.decimal :budget
      t.decimal :amount, default: 0
      t.string :note
      t.string :sku
      t.decimal :price, precision: 10, scale: 2, default: 0
      t.decimal :advance_price, default: 0
      t.json :extra, default: {}
      t.string :unit
      t.decimal :quantity, default: 0
      t.decimal :unified_quantity, default: 0
      t.string :buyer_type
      t.integer :buyer_id
      t.timestamps
    end

    add_reference :expenses, :fund_use
    remove_column :expenses, :expendable_type, :financial_type
    remove_column :expenses, :expendable_id, :financial_id












































    add_reference :user_tags, :user_tagging, polymorphic: true
    remove_column :user_tags, :tagging_type, :string
    remove_column :user_tags, :tagging_id, :integer, scale: 8































































    add_column :projects, :budget_amount, :decimal






























































































  end

end
