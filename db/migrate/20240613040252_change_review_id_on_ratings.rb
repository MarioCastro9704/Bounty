class ChangeReviewIdOnRatings < ActiveRecord::Migration[7.1]
  def change
    change_column_null :ratings, :review_id, false
  end
end
