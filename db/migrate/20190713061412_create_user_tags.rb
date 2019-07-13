class CreateUserTags < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tags do |t|
      t.references :organ  # For SaaS
      t.references :tagging, polymorphic: true
      t.string :name
      t.integer :user_taggeds_count
      t.timestamps
    end

    create_table :user_taggeds do |t|
      t.references :user_tag
      t.references :user
      t.timestamps
    end

    remove_columns :wechat_tags, :tagging_type, :tagging_id
    add_reference :wechat_tags, :user_tag

    create_table :annunciations do |t|
      t.references :organ
      t.references :publisher, polymorphic: true
      t.string :title
      t.string :body
      t.string :link
      t.timestamps
    end
    
    create_table :annunciates do |t|
      t.references :annunciation
      t.references :user_tag
      t.string :receiver_type
      t.string :state
      t.datetime :annunciated_at
      t.timestamps
    end
    
  end
end
