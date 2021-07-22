require 'csv'
quote_chars = %w(" | ~ ^ & *)

puts 'Seeding DB...'
RecipeIngredient.destroy_all
Recipe.destroy_all
Ingredient.destroy_all


puts 'Creating recipes...'
CSV.foreach(Rails.root.join('lib/seed_csv/db_recipes.csv'), headers: true, :quote_char => "\x00") do |row|
    Recipe.create({
      name: row['name'],
      prep_time: row['prep_time'],
      photo_url: row['photo']
    })
end

puts 'Creating ingredients...'
CSV.foreach(Rails.root.join('lib/seed_csv/db_ingredients.csv'), headers: true, :quote_char => "\x00") do |row|
    Ingredient.create({
      name: row['name']
    })
end

puts 'Creating xref...'
CSV.foreach(Rails.root.join('lib/seed_csv/db_ingredients.csv'), headers: true, :quote_char => "\x00") do |row|
  RecipeIngredient.create({
    recipe_id: Recipe.find_by(name: row['recipe']).id,
    ingredient_id: Ingredient.find_by(name: row['name']).id,
    unit: row['unit'],
    quantity: row['quantity']
  })
end

puts 'Creating ingredient swap...'
CSV.foreach(Rails.root.join('lib/seed_csv/db_ingredients_swaps.csv'), headers: true, :quote_char => "\x00") do |row|
  IngredientSwap.create({
    recipe_id: Recipe.find_by(name: row['recipe']).id,
    ingredient_id: Ingredient.find_by(name: row['name']).id,
    alternative_ingredient: row['alternative_ingredient'],
    alternative_quantity: row['alternative_quantity'],
    alternative_unit: row['alternative_unit']
  })
end

puts 'Finished...'
