class AddProfileToJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :profile, foreign_key: true
  end
end
