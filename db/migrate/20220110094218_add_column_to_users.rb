class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string, null: false, default: ""
    add_column :users, :is_deleted, :boolean,  null: false, default: false
    add_column :users, :profile_image_id, :string,  null: false, default: ""
    add_column :users, :family_name, :string,  null: false, default: ""
    add_column :users, :first_name, :string,  null: false, default: ""
    add_column :users, :family_name_kana, :string,  null: false, default: ""
    add_column :users, :first_name_kana, :string,  null: false, default: ""
  end
end
