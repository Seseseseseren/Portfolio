class ChangeSubscriptionGenresToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_table :subscription_genres, :genres
  end
end
