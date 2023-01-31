class CategoriesController < ApplicationController
  def index
    @categories = Variety.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Variety.new(category_params)
  end

  def show
    @category = Variety.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
