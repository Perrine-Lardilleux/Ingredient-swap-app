class DropInstalls < ActiveRecord::Migration[6.0]
  def change
    drop_table :ingredient_swaps
    drop_table :ingredients
  end
end
