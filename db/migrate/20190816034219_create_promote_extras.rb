class CreatePromoteExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :promote_extras do |t|
      t.references :promote
      t.string :extra_name
      t.string :column_name
      t.timestamps
    end
  end
end
