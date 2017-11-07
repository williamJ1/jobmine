class RemoveCreatedByUserFromJobs < ActiveRecord::Migration[5.1]
  def change
    remove_column :jobs, :created_by_user, :integer
  end
end
