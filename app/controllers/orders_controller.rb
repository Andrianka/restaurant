class OrdersController < ApplicationController

  def index
    if params[:tab] == Order::New.downcase
      @orders = Order.all.anew
    elsif params[:tab] == Order::InProgress.downcase
      @orders = Order.all.inprogress
    elsif params[:tab] == Order::Done.downcase
      @orders = Order.all.done
    elsif params[:tab] == Order::Payed.downcase
      @orders = Order.all.payed
    elsif params[:tab] == Order::Closed.downcase
      @orders = Order.all.closed
    elsif params[:tab] == Order::Reservation.downcase
      @orders = Order.all.reservation
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def update_status
    @order = Order.find(params[:id])
    Order::Statuses.each_with_index do |status, i|
      if @order.status == status && @order.update_attributes(status: Order::Statuses[i+1])
        redirect_to action: :index, tab: Order::Statuses[i+1].downcase and return
      end
    end
    redirect_to action: :index,tab: status.downcase and return
  end

  def user_order
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items
  end

  def client_order
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def all_client_orders
    @user = User.find(params[:order][:user_id])
    @orders = @user.orders
    @orders_items = @orders.order_items
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :status)
  end
end
