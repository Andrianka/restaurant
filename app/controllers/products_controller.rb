class ProductsController < ApplicationController

  def menu
    @categories = Category.order(order_number: :asc)
    @products = Product.all
    if current_order
      @order_item = current_order.order_items
    else
      current_order = Order.new
      @order_item = current_order.order_items.new
    end
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @products_news= Product.all.sample(3)
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
