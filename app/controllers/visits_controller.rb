class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end

  def new
    @visit = Visit.new
  end

  def show
    @visit = Visit.find params[:id]
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      @visit.images.attach(params[:images]) if params[:images]
      category_ids = params[:visit][:category_ids]

      category_ids.each_with_index do |category_id, index|
        category = Category.find(category_id)
        @visit.categories << category

        value = params[:visit][:category][:ratings][index][:value]

        category.ratings.create!(value: value)
      end

      redirect_to visits_path
    else
      render :new
    end
  end

  def visit_params
    params.require(:visit).permit(:name, :address, :user_id, images: [], comment_attributes: %i[id text ],
                                  category_ids: [], ratings_attributes: [:id, :value, :category_id])
  end
end
