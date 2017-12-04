class AddUserprofileAndJobToContract < ActiveRecord::Migration[5.1]
  def change
    add_reference :contracts, :profile, foreign_key: true
    add_reference :contracts, :job, foreign_key: true
  end
end
