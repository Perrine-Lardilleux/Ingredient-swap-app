class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :photo_url, :photo
  end
end
