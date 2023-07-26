class RemoveVisitIdAndCategoryIdFromRatings < ActiveRecord::Migration[6.0]
  def change
    remove_column :ratings, :visit_id
    remove_column :ratings, :category_id
  end
end
