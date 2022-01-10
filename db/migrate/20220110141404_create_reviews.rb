class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :subscription_id
      t.string :title, null: false, default: ""
      t.float :rate
      t.text :body, null: false, default: ""

      t.timestamps
    end
  end
end
