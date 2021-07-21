require 'csv'
quote_chars = %w(" | ~ ^ & *)

puts 'Seeding DB...'
Recipe.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all

puts 'Creating recipes...'
CSV.foreach(Rails.root.join('lib/seed_csv/db_recipes.csv'), headers: true, liberal_parsing: true) do |row|
    Recipe.create({
      name: row['name'],
      prep_time: row['prep_time'],
      photo: row['photo']
    })
end

puts 'Creating ingredients...'
CSV.foreach(Rails.root.join('lib/seed_csv/db_ingredients.csv'), headers: true, liberal_parsing: true) do |row|
    Ingredient.create({
      name: row['name']
    })
end

CSV.foreach(Rails.root.join('lib/seed_csv/db_ingredients.csv'), headers: true, liberal_parsing: true) do |row|
  RecipeIngredient.create({
    recipe_id: Recipe.find_by(name: row['recipe']).id,
    ingredient_id: Ingredient.find_by(name: row['name']).id,
    unit: row['unit'],
    quantity: row['quantity']
  })
end

# puts 'Creating ingredient swap...'
# CSV.foreach(Rails.root.join('lib/seed_csv/db_ingredients_swaps.csv'), headers: true, liberal_parsing: true) do |row|
#     IngredientSwap.create({
#       recipe: row['recipe'],
#       ingredient: row['ingredient'],
#       alternative_ingredient: row['alternative_ingredient'],
#       alternative_quantity: row['alternative_quantity'],
#       alternative_unit: row['alternative_unit']
#     })
# end

puts 'Finished...'
