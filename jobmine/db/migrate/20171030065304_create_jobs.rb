class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :created_by_user
      t.text :tile
      t.text :description
      t.datetime :begin_date_time
      t.datetime :end_date_time

      t.timestamps
    end
  end
end
