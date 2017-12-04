class AddAccountStatusToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :account_status, :string
  end
end
