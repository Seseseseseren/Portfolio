class RenameSubscriptionIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :subscription_id, :review_id
  end
end
