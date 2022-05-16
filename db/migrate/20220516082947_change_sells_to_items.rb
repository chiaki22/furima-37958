class ChangeSellsToItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :sells, :items
  end
end
