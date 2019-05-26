class AddPassageTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :passage_time, :integer, null: false, default: 30
  end
end
