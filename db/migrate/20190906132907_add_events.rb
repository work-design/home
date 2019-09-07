class AddEvents < ActiveRecord::Migration[6.0]
  def change
    rename_table :time_plans, :plans
    rename_column :plans, :plan_type, :planned_type
    rename_column :plans, :plan_id, :planned_id
    rename_column :plans, :room_id, :place_id
    add_column :plans, :repeat_count, :integer
    
    rename_table :time_bookings, :bookings
    rename_column :bookings, :room_id, :place_id
    remove_column :bookings, :time_list_id
    
    rename_column :plan_attenders, :room_id, :place_id
    rename_column :plan_items, :room_id, :place_id
    rename_column :plan_items, :time_bookings_count, :bookings_count
    remove_columns :plan_items, :plan_type, :time_plan_id, :time_list_id
    
    create_table :plan_participants do |t|
      t.references :plan
      t.references :event_participant
      t.references :participant, polymorphic: true
      t.timestamps
    end
    add_reference :plan_attenders, :plan_member

    create_table :event_taxons do |t|
      t.string :name
      t.timestamps
    end

    create_table :events do |t|
      t.references :event_taxon
      t.string :type
      t.string :title
      t.string :description, limit: 4096
      t.integer :position
      t.integer :event_members_count, default: 0
      t.integer :event_items_count, default: 0
      t.timestamps
    end

    create_table :event_items do |t|
      t.references :event
      t.string :title
      t.references :author
      t.timestamps
    end

    create_table :event_grants do |t|
      t.references :event
      t.string :grant_kind
      t.string :grant_column
      t.jsonb :filter, default: {}
      t.timestamps
    end

    create_table :crowds do |t|
      t.references :organ  # For SaaS
      t.string :name
      t.string :member_type
      t.integer :crowd_members_count, default: 0
      t.timestamps
    end

    create_table :crowd_members do |t|
      t.references :crowd
      t.references :member, polymorphic: true
      t.references :agency
      t.string :state
      t.timestamps
    end

    create_table :event_participants do |t|
      t.references :event
      t.references :participant, polymorphic: true
      t.string :state
      t.integer :score
      t.string :comment, limit: 4096
      t.string :quit_note
      t.string :assigned_status
      t.string :job_id
      t.timestamps
    end

  end
end
