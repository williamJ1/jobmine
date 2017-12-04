class AddAverageRatingToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :average_rating, :decimal, default: -1.0
  end
end
