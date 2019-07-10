# This migration comes from the_role_engine (originally 20111025025129)
class CreateRoles < ActiveRecord::Migration[5.0]

  def change

    create_table :sections do |t|
      t.string :name
      t.string :code
      t.integer :position, default: 0
      t.timestamps
    end

    create_table :rules do |t|
      t.string :name
      t.string :code
      t.references :section
      t.integer :position, default: 0
      t.timestamps
    end

    create_table :roles do |t|
      t.string :name, null: false
      t.text :description
      t.timestamps
    end

    create_table :role_rules do |t|
      t.references :role
      t.references :rule
      t.timestamps
    end

    create_table :whos do |t|
      t.string :name, null: false
      t.string :type
      t.timestamps
    end

    create_table :who_roles do |t|
      t.references :who
      t.references :role
      t.timestamps
    end

  end

end
