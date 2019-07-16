# This migration comes from rails_booking_engine (originally 20190312023841)
class RailsBookingInit < ActiveRecord::Migration[5.0]

  def change

    create_table :time_lists do |t|
      t.string :name
      t.string :code
      t.integer :interval_minutes, default: 0
      t.integer :item_minutes, default: 45
      t.boolean :default
      t.timestamps
    end

    create_table :time_items do |t|
      t.references :time_list
      t.time :start_at
      t.time :finish_at
      t.integer :position, default: 1
      t.timestamps
    end

    create_table :time_plans do |t|
      t.references :time_list
      t.references :plan, polymorphic: true
      t.references :room
      t.date :begin_on
      t.date :end_on
      t.string :repeat_type
      t.integer :repeat_days, array: true
      t.timestamps
    end
    
    create_table :plan_items do |t|
      t.references :time_plan
      t.references :plan, polymorphic: true
      t.references :time_item
      t.references :time_list
      t.references :room
      t.date :plan_on
      t.string :repeat_index
      t.integer :time_bookings_count, default: 0
      t.jsonb :extra
      t.timestamps
    end

    create_table :time_bookings do |t|
      t.references :booker, polymorphic: true
      t.references :booked, polymorphic: true
      t.references :plan_item
      t.references :time_item
      t.references :time_list
      t.references :room
      t.date :booking_on
      t.timestamps
    end
    
    create_table :plan_attenders do |t|
      t.references :plan_item
      t.references :attender, polymorphic: true
      t.references :room
      t.boolean :attended
      t.string :state
      t.jsonb :extra
      t.timestamps
    end
  
  end

end
