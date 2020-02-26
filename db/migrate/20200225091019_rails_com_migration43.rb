class RailsComMigration43 < ActiveRecord::Migration[6.0]

  def change

    add_column :accounts, :source, :string

























    create_table :financial_taxons do |t|
      t.references :parent
      t.references :verifier
      t.jsonb :parent_ancestors
      t.string :name
      t.integer :position
      t.boolean :take_stock, comment: "是否有库存"
      t.boolean :individual, comment: "是否可盘点"
      t.timestamps
    end

    create_table :expense_items do |t|
      t.references :expense
      t.references :member
      t.references :financial_taxon
      t.decimal :budget, precision: 10, scale: 2
      t.decimal :amount, precision: 10, scale: 2
      t.string :note
      t.string :state
      t.integer :quantity, default: 1
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end

    create_table :expense_members do |t|
      t.references :expense
      t.references :member
      t.references :payment_method
      t.references :cash
      t.references :operator
      t.references :payable, polymorphic: true
      t.decimal :amount, precision: 10, scale: 2
      t.boolean :advance
      t.string :state, default: "pending"
      t.string :note
      t.string :type
      t.string :payout_uuid
      t.decimal :requested_amount, precision: 10, scale: 2
      t.decimal :actual_amount, precision: 10, scale: 2
      t.datetime :paid_at
      t.string :account_bank
      t.string :account_name
      t.string :account_num
      t.timestamps
    end

    create_table :expenses do |t|
      t.references :payout
      t.references :creator
      t.references :financial_taxon
      t.references :payment_method
      t.references :verifier
      t.string :type
      t.string :state, default: "init"
      t.string :subject
      t.decimal :amount, precision: 10, scale: 2
      t.string :note, limit: 4096
      t.integer :invoices_count
      t.timestamps
    end





























































































































































    create_table :financial_taxon_hierarchies do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false, index: {:name=>"financial_taxon_desc_idx"}
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "financial_taxon_anc_desc_idx"
    end









  end

end
