class AddMethodToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :method, :string
    add_index :badges, :method, unique: true
  end
end
