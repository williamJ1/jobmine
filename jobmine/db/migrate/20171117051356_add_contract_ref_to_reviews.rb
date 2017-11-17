class AddContractRefToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :contract, foreign_key: true
  end
end
