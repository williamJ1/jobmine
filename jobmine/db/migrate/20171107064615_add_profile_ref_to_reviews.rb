class AddProfileRefToReviews < ActiveRecord::Migration[5.1]
  def change
  	add_reference :reviews, :profile, foreign_key: true
  end
end
