class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|

      t.integer :genre_id
      t.string :subscription_name,null: false, default: ""
      t.string :subscription_image_id
      t.integer :subscription_fee,null: false, default: 0
      t.string :payment_date,null: false, default: ""

      t.timestamps
    end
  end
end
