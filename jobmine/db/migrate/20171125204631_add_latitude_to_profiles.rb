class AddLatitudeToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :latitude, :decimal
  end
end
