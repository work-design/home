class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :nation, default: ''
      t.string :province, default: ''
      t.string :city, default: ''
      t.boolean :published, default: true
      t.boolean :popular, default: false
      t.timestamps
    end
  end
end
