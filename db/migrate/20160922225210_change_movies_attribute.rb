class ChangeMoviesAttribute < ActiveRecord::Migration
  def change
    remove_column :movies, :favorite, :boolean
    rename_column :movies, :name, :title
    add_column :movies, :actors, :string
    add_column :movies, :language, :string
  end
end
