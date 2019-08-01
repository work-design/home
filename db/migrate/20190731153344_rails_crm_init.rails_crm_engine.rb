# This migration comes from rails_crm_engine (originally 20190315035332)
class RailsCrmInit < ActiveRecord::Migration[6.0]
  def change
    create_table :maintains do |t|
      t.references :member
      t.references :client, polymorphic: true
      t.references :tutelar, polymorphic: true
      t.references :tutelage
      t.references :maintain_source
      t.references :organ  # For SaaS
      t.references :pipeline_member
      t.references :pipeline
      t.string :state
      t.string :note
      t.timestamps
    end

    create_table :maintain_source_templates do |t|
      t.string :name
      t.timestamps
    end

    create_table :maintain_sources do |t|
      t.references :organ  # For SaaS
      t.references :maintain_source_template
      t.string :name
      t.integer :maintains_count, default: 0
    end

    create_table :maintain_tag_templates do |t|
      t.string :name
      t.string :logged_type
      t.string :entity_column
      t.string :entity_value
      t.integer :sequence
      t.string :color
      t.timestamps
    end

    create_table :maintain_tags do |t|
      t.references :maintain_tag_template
      t.references :organ
      t.string :name
      t.boolean :manual
      t.integer :sequence
      t.integer :maintain_logs_count, default: 0
      t.string :color
      t.string :logged_type
      t.timestamps
    end

    create_table :maintain_logs do |t|
      t.references :maintain
      t.references :member
      t.references :logged, polymorphic: true
      t.references :maintain_tag
      t.string :note
      t.jsonb :extra, default: {}
      t.timestamps
    end
    
    add_reference :orders, :maintain
  end
end
