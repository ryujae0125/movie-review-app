class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.date :date
      t.string :director
      t.boolean :favorite

      t.timestamps null: false
    end
  end
end
