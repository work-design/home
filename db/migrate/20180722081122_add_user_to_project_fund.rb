class AddUserToProjectFund < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_funds, :user
  end
end
