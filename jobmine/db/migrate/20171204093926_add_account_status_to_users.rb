class AddAccountStatusToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :account_status, :string
  end
end
