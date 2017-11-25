class AddApproveStatusAndPaidTimeToTimeslot < ActiveRecord::Migration[5.1]
  def change
    add_column :timeslots, :approve_status, :integer
    add_column :timeslots, :paid_time, :datetime
    #aproveStatus
    #0 = waiting
    #2 = rejected
    #1 = approved
  end
end
