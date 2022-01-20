class AddIndexUserIdAndSubscriptionIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_index :reviews, [:user_id, :subscription_id], unique: true
  end
end
