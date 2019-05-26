class AddDeadlineToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :deadline, :timestamp, null: false
  end
end
