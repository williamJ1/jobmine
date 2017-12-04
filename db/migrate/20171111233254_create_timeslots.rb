class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.datetime :date_time_begin
      t.integer :time_length
      t.boolean :is_approved
      t.boolean :is_paid
      t.timestamps
    end
  end
end
