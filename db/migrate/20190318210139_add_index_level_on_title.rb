class AddIndexLevelOnTitle < ActiveRecord::Migration[5.2]
  def change
    add_index(:tests, [:id, :level], unique: true)
  end
end
