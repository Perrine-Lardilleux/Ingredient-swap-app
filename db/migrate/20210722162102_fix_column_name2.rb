class FixColumnName2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :photo, :photo_url
  end
end
