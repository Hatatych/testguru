class CreateTestsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :tests do |t|
      t.index [:user_id, :test_id], unique: true
      t.boolean :completed, default: false
    end
  end
end
