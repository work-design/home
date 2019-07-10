class AddDoneAtToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :done_at, :datetime
    add_column :tasks, :content, :string

    add_column :workers, :type, :string, limit: 50
    add_column :workers, :status, :integer
    add_column :workers, :leader_id, :integer
  end
end
