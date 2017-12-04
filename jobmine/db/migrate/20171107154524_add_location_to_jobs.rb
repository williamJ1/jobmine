class AddLocationToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :location, :string
    add_column :jobs, :hour_rate, :decimal
  end
end
