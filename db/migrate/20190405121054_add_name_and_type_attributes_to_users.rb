class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :last_name, :string
    remove_column :users, :role
  end
end
