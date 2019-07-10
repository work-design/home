# This migration comes from rails_factory_engine (originally 20180507153935)
class RailsFactoryInit < ActiveRecord::Migration[5.2]
  def change

    create_table :products, force: true do |t|
      t.string :name
      t.string :qr_prefix
      t.timestamps
    end

    create_table :parts, force: true do |t|
      t.references :provider
      t.string :name
      t.string :qr_prefix
      t.timestamps
    end

    create_table :product_parts, force: true do |t|
      t.references :product
      t.references :part
      t.timestamps
    end

    create_table :product_items, force: true do |t|
      t.references :product
      t.string :qr_code
      t.string :state
      t.datetime :produced_at
      t.timestamps
    end

    create_table :part_items, force: true do |t|
      t.references :part
      t.references :product_item
      t.string :qr_code
      t.string :state
      t.datetime :received_at
      t.timestamps
    end

    create_table :part_plans do |t|
      t.references :part
      t.datetime :start_at
      t.datetime :finish_at
      t.string :state
      t.integer :purchased_count, default: 0
      t.integer :received_count, default: 0
      t.timestamps
    end

    create_table :product_plans do |t|
      t.references :product
      t.datetime :start_at
      t.datetime :finish_at
      t.string :state
      t.integer :planned_count, default: 0
      t.integer :produced_count, default: 0
      t.timestamps
    end

  end
end
