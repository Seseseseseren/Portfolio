class DropTableSubscriptionMembers < ActiveRecord::Migration[5.2]
  def change
    drop_table :subscription_members
  end
end
