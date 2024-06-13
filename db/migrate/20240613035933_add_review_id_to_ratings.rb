class AddReviewIdToRatings < ActiveRecord::Migration[7.1]
  def change
    add_reference :ratings, :review, foreign_key: true, null: true
  end
end
