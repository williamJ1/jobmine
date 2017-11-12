class AddContractReferenceToTimeslot < ActiveRecord::Migration[5.1]
  def change
    add_reference :timeslots, :contract, foreign_key: true
  end
end
