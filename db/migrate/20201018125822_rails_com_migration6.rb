class RailsComMigration6 < ActiveRecord::Migration[6.1]

  def change







    remove_column :organs, :organ_uuid, :string
    remove_column :organs, :locale, :string
    remove_column :organs, :timezone, :string















    add_column :areas, :timezone, :string
    add_column :areas, :locale, :string



    create_table :fund_budgets do |t|
      t.references :fund
      t.references :financial, polymorphic: true
      t.decimal :amount, default: 0
      t.string :note
      t.timestamps
    end


    create_table :fund_expenses do |t|
      t.references :fund
      t.references :financial, polymorphic: true
      t.decimal :amount, default: 0
      t.string :note
      t.timestamps
    end

    add_column :fund_incomes, :note, :string
    add_column :fund_incomes, :state, :string, default: "init"
    remove_column :fund_incomes, :name, :string




    rename_column :funds, :budget, :budget_amount
    add_column :funds, :budget_detail, :jsonb, default: {}
    add_column :funds, :expense_amount, :decimal, default: 0
    add_column :funds, :expense_detail, :jsonb, default: {}

    add_reference :expenses, :financial, polymorphic: true











































































































    rename_column :projects, :fund_amount, :fund_expense


    add_column :project_taxons, :fund_budget, :decimal
    add_column :project_taxons, :fund_expense, :decimal
    add_column :project_taxons, :budget_amount, :decimal
    add_column :project_taxons, :expense_amount, :decimal








    add_column :project_stages, :note, :string
    remove_column :project_stages, :state, :string




















































































  end

end
