class CreateVisitsCategoriesRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :visits_categories_ratings do |t|
      t.references :visits_category, null: false, foreign_key: true
      t.references :rating, null: false, foreign_key: true

      t.timestamps
    end
  end
end
