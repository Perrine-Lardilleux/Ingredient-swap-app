class IngredientSwap < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :alternative_ingredient
end
