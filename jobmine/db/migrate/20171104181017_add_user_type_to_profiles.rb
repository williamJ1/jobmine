class AddUserTypeToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :user_type, :string
  end
end
