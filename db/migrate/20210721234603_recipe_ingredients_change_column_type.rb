class RecipeIngredientsChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column(:recipe_ingredients, :quantity, :string)
  end
end
