class AddIndexUserIdAndReviewIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:user_id, :review_id], unique: true
  end
end
