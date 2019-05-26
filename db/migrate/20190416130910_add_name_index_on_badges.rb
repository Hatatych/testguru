class AddNameIndexOnBadges < ActiveRecord::Migration[5.2]
  def change
    add_index :badges, :name
  end
end
