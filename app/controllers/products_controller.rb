class ProductsController < ApplicationController

  def menu
    @categories = Category.order(order_number: :asc)
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to menu_path
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to menus_path
    else
      render :show
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to menu_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :weight, :quantity,
     :price)
  end
end
