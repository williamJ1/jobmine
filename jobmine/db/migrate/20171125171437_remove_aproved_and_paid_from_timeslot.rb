class RemoveAprovedAndPaidFromTimeslot < ActiveRecord::Migration[5.1]
  def change
    remove_column :timeslots, :is_approved, :boolean
    remove_column :timeslots, :is_paid, :boolean
  end
end
