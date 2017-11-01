class CreateFilmCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :film_categories do |t|
      t.references :category
      t.references :film

      t.timestamps
    end
  end
end
