class RailsComMigration47 < ActiveRecord::Migration[6.0]

  def change























    create_table :attitudes do |t|
      t.references :user
      t.references :attitudinal, polymorphic: true
      t.string :opinion
      t.timestamps
    end

    create_table :stars do |t|
      t.references :starred, polymorphic: true
      t.references :user
      t.timestamps
    end

    create_table :comments do |t|
      t.references :user
      t.references :parent
      t.references :commentable, polymorphic: true
      t.string :title
      t.string :content
      t.string :state
      t.float :score, default: 0
      t.integer :liked_count, default: 0
      t.integer :star_count, default: 0
      t.timestamps
    end

    create_table :abuses do |t|
      t.references :user
      t.references :abusement, polymorphic: true
      t.string :note
      t.timestamps
    end














































































































    add_reference :packages, :address































































  end

end
