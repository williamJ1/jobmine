class AddLongitubeToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :longitude, :double
  end
end
