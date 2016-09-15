class CreateFavoriteMovies < ActiveRecord::Migration
  def change
    create_table :favorite_movies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :favorite
      t.datetime :favorited_at

      t.timestamps null: false
    end
  end
end
