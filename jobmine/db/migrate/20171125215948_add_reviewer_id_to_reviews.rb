class AddReviewerIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :reviewer_id, :integer
  end
end
