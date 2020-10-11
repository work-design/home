class RailsComMigration4 < ActiveRecord::Migration[6.1]

  def change








    add_column :members, :notifiable_types, :string, default: [], array: true
    add_column :members, :counters, :jsonb, default: {}
    add_column :members, :showtime, :integer, default: 0
    add_column :members, :accept_email, :boolean, default: true








    add_column :users, :notifiable_types, :string, default: [], array: true
    add_column :users, :counters, :jsonb, default: {}
    add_column :users, :showtime, :integer, default: 0
    add_column :users, :accept_email, :boolean, default: true










    add_reference :expense_items, :budget
    add_column :expense_items, :budget_amount, :decimal
    remove_column :expense_items, :budget, :decimal, precision: 10

    create_table :budgets do |t|
      t.references :organ
      t.references :member
      t.references :budgeting, polymorphic: true
      t.references :financial_taxon
      t.string :state, default: "init"
      t.string :subject
      t.decimal :amount
      t.string :note, limit: 4096
      t.timestamps
    end


    add_reference :expenses, :budget













































    add_column :annunciations, :type, :string

    create_table :user_annunciates do |t|
      t.references :annunciation
      t.references :user_tag
      t.integer :notifications_count, default: 0
      t.string :state
      t.datetime :annunciated_at
      t.timestamps
    end

    create_table :member_annunciates do |t|
      t.references :annunciation
      t.references :job_title
      t.references :department
      t.integer :notifications_count, default: 0
      t.string :state
      t.datetime :annunciated_at
      t.timestamps
    end




























































    add_column :projects, :fund_budget, :decimal
    add_column :projects, :expense_amount, :decimal
    remove_column :projects, :budget, :decimal


    add_column :project_funds, :budget, :decimal






    create_table :project_preferences do |t|
      t.references :project_taxon
      t.references :facilitate_taxon
      t.references :facilitate
      t.references :provider
      t.timestamps
    end

    create_table :project_facilitates do |t|
      t.references :project
      t.references :facilitate_taxon
      t.references :facilitate
      t.references :provider
      t.timestamps
    end






















































































  end

end
