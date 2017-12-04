class AddLatitudeToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :latitude, :decimal
  end
end
