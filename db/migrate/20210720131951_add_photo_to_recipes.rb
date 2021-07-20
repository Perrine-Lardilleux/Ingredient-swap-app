class AddPhotoToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :photo_url, :string
  end
end
