class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :prep_time, :photo)
  end

end
