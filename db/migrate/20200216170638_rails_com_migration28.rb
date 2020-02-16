class RailsComMigration28 < ActiveRecord::Migration[6.0]

  def change































































    create_table :aim_entities do |t|
      t.references :aim
      t.references :user
      t.references :entity, polymorphic: true
      t.references :reward_expense
      t.references :aim_user
      t.references :reward
      t.integer :present_point
      t.string :state
      t.string :serial_number
      t.datetime :last_access_at
      t.string :ip
      t.decimal :reward_amount, precision: 10, scale: 2
      t.integer :aim_logs_count, default: 0
      t.timestamps
    end

    create_table :aim_users do |t|
      t.references :aim
      t.references :user
      t.string :serial_number
      t.string :state, default: "task_doing"
      t.integer :reward_amount, default: 0
      t.integer :aim_entities_count, default: 0
      t.timestamps
    end

    create_table :reward_expenses do |t|
      t.references :reward
      t.references :user
      t.references :coin
      t.references :aim
      t.decimal :amount, precision: 10, scale: 2, default: 0
      t.timestamps
    end

    create_table :rewards do |t|
      t.references :entity, polymorphic: true
      t.decimal :min_piece, precision: 10, scale: 2, default: 1
      t.decimal :max_piece, precision: 10, scale: 2, default: 10
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :income_amount, precision: 10, scale: 2
      t.decimal :expense_amount, precision: 10, scale: 2
      t.datetime :start_at
      t.datetime :finish_at
      t.boolean :enabled, default: true
      t.integer :lock_version
      t.timestamps
    end

    create_table :reward_incomes do |t|
      t.references :reward
      t.references :user
      t.decimal :reward_amount, precision: 10, scale: 2, default: 0
      t.timestamps
    end

    create_table :aim_logs do |t|
      t.references :aim
      t.references :user
      t.references :entity, polymorphic: true
      t.references :aim_entity
      t.references :reward
      t.string :serial_number
      t.string :ip
      t.string :code
      t.boolean :rewarded
      t.datetime :created_at, null: false
    end

    create_table :aims do |t|
      t.string :name
      t.string :unit
      t.string :repeat_type
      t.decimal :rate, precision: 10, scale: 2, default: 1
      t.integer :task_point, default: 0
      t.integer :reward_point, default: 0
      t.integer :reward_amount, default: 0
      t.boolean :verbose
      t.timestamps
    end

    create_table :praise_users do |t|
      t.references :user
      t.references :reward
      t.references :entity, polymorphic: true
      t.decimal :amount, precision: 10, scale: 2, default: 0
      t.integer :position
      t.timestamps
    end

    create_table :aim_codes do |t|
      t.references :aim
      t.string :controller_path
      t.string :action_name
      t.string :code, null: false
      t.timestamps
    end

    create_table :praise_incomes do |t|
      t.references :reward
      t.references :user
      t.references :earner
      t.references :source, polymorphic: true
      t.references :praise_user
      t.decimal :amount, precision: 10, scale: 2, comment: "用户打赏", default: 0
      t.decimal :profit_amount, precision: 10, scale: 2, comment: "平台收入", default: 0
      t.decimal :royalty_amount, precision: 10, scale: 2, comment: "作者分成", default: 0
      t.decimal :reward_amount, precision: 10, scale: 2, comment: "赏金池", default: 0
      t.string :state, default: "init"
      t.timestamps
    end



















































































































  end

end
