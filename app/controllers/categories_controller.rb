class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order('order_number ASC')
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path
    else
      render :show
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :title, :order_number, :description)
  end
end
