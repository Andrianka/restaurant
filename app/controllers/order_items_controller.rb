class OrderItemsController < ApplicationController

  def create
    if current_user
      @order = current_order
      @order.user_id = current_user.id
      @order.status = Order::InProgress
      @order.save
      @order_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
      if @order_item.nil?
        @order_item = @order.order_items.create(order_item_params)
      else
        @order_item.update_attributes(order_item_params)
      end
      session[:order_id] = @order.id
    else
      respond_to do |format|
        format.js {render text: "window.location = '/users/sign_in';"}
      end
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
