class CreateIngredientSwaps < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_swaps do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.string :alternative_ingredient
      t.string :alternative_quantity
      t.string :alternative_unit

      t.timestamps
    end
  end
end
