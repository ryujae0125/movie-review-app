class DeleteFavorite < ActiveRecord::Migration
  def change
    remove_column :favorite_movies, :favorite, :boolean
  end
end
