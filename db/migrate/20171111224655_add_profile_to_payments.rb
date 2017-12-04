class AddProfileToPayments < ActiveRecord::Migration[5.1]
  def change
      add_reference :payments, :profile, foreign_key: true
  end
end


