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

      redirect_to visits_path
    else
      render :new
    end
  end

  def visit_params
    params.require(:visit).permit(:name, :address, :user_id, images: [], comment_attributes: %i[id text ])
  end
end
