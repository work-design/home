class RailsComMigration8 < ActiveRecord::Migration[6.1]

  def change












    remove_column :profiles, :identity, :string
    remove_column :profiles, :extra, :jsonb















    add_reference :fund_expenses, :fund_budget


    remove_column :expense_items, :member_id, :integer, scale: 8




    add_reference :expenses, :fund
    remove_column :expenses, :fund_use_id, :integer, scale: 8








































































































    remove_column :projects, :github_repo, :string
    remove_column :projects, :project_stage_id, :integer, scale: 8
    rename_column :projects, :parameters, :extra

    add_column :project_taxons, :projects_count, :integer


    create_table :indicator_taxons do |t|
      t.references :organ
      t.string :name
      t.string :color
      t.string :description
      t.integer :indicators_count
      t.timestamps
    end


    create_table :project_indicators do |t|
      t.references :project
      t.references :indicator
      t.date :recorded_on
      t.datetime :recorded_at
      t.string :value
      t.string :source
      t.string :comment
      t.timestamps
    end

    add_reference :facilitates, :organ

    add_reference :facilitate_taxons, :organ



    create_table :indicators do |t|
      t.references :organ
      t.references :indicator_taxon
      t.string :name
      t.string :description
      t.string :unit
      t.decimal :reference_min
      t.decimal :reference_max
      t.string :targt_source
      t.timestamps
    end



    add_column :project_stages, :projects_count, :integer

    create_table :project_mileposts do |t|
      t.references :project
      t.references :milepost
      t.date :recorded_on
      t.boolean :current
      t.string :milepost_name
      t.timestamps
    end


    create_table :mileposts do |t|
      t.references :organ
      t.string :name
      t.integer :position
      t.integer :project_mileposts_count
      t.timestamps
    end


















































































  end

end
