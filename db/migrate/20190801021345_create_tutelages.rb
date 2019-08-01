class CreateTutelages < ActiveRecord::Migration[6.0]
  def change
    create_table :tutelages do |t|
      t.references :tutelar
      t.references :pupil
      t.references :user
      t.string :relation
      t.boolean :major
      t.timestamps
    end
  end
end
