class VisitsController < ApplicationController
  before_action :set_visit, only: %i[show edit update destroy]

  def index
    @visits = Visit.all
  end

  def new
    @visit = Visit.new
  end

  def edit; end

  def show
    @visits_categories_ratings = VisitsCategoriesRating.includes(:rating, visits_category: [:category])
                                                       .where(visits_category_id: @visit.visits_categories.pluck(:id))
  end

  def create
    visit = Visit.new(visit_params.except(:category_ids))
    if visit.save!
      visit.images.attach(params[:images]) if params[:images]

      category_ids = params[:visit][:category_ids]
      category_ids.each_with_index do |category_id, index|
        category = Category.find(category_id)
        visits_category = VisitsCategory.create!(visit: visit, category: category)

        value = params[:visit][:category][:ratings][index][:value]
        next unless value.present?

        visits_category.ratings.create!(value: value)
      end

      redirect_to visits_path, notice: 'Visit was successfully created.'
    end
  end

  def update
    @visit.assign_attributes(visit_params.except(:category_ids))
    @visit.images.attach(params[:images]) if params[:images]
    @visit.save!

    redirect_to visits_path, notice: 'Visit was successfully updated.'
  end

  def destroy
    @visit.destroy!
    redirect_to visits_path, notice: 'Visit was successfully destroyed.'
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:name, :address, :user_id, images: [], comments_attributes: %i[id text],
                                  category_ids: [])
  end
end
