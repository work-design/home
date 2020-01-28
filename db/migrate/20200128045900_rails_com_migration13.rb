class RailsComMigration13 < ActiveRecord::Migration[6.0]

  def change















    create_table :requirement_volunteers do |t|
      t.references :requirement
      t.references :volunteer
      t.string :state
      t.timestamps
    end

    create_table :requirements do |t|
      t.string :name
      t.string :mobile
      t.string :from
      t.string :to
      t.date :pick_on
      t.time :pick_at
      t.string :note
      t.timestamps
    end

    create_table :volunteers do |t|
      t.string :name
      t.string :mobile
      t.string :place
      t.timestamps
    end


































































































































































  end

end
