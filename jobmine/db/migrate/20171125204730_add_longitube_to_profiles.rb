class AddLongitubeToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :longitude, :double
  end
end
