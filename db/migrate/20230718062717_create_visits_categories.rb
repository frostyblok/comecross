class CreateVisitsCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :visits_categories do |t|
      t.references :visit, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
