class AddRatingStarToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :rating_star, :integer, default: 0
  end
end
