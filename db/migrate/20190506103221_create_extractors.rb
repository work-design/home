class CreateExtractors < ActiveRecord::Migration[6.0]
  def change
    create_table :extractors do |t|
      t.references :wechat_config
      t.string :name
      t.string :prefix
      t.string :suffix
      t.boolean :more
      t.timestamps
    end
  
    create_table :extractions do |t|
      t.references :extractor
      t.references :extractable, polymorphic: true
      t.string :name
      t.string :matched
      t.timestamps
    end
    
    add_reference :wechat_responses, :effective, polymorphic: true
  end
end
