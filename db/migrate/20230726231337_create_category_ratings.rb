class CreateCategoryRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :category_ratings do |t|
      t.references :rating, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
