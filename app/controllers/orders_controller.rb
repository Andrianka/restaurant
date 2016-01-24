class OrdersController < ApplicationController
  include ApplicationHelper

  def index
    if params[:tab] == Order::New.downcase
      @orders = Order.all.anew
    elsif params[:tab] == Order::Inprogress.downcase
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
    @notifications = Notification.all
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
      notification_order(msg: Notification::Success, action: "created order", el: @order)
      redirect_to order_path(@order)
    else
      notification_order(msg: Notification::Error, action: "created order", el: @order)
      render :new
    end
  end

  def update_status
    @order = Order.find(params[:id])
    el_old = @order.dup
    Order::Statuses.each_with_index do |status, i|
      if @order.status == status
        if @order.update_attributes(status: Order::Statuses[i+1])
          notification_order_status(msg: Notification::Success, action: "update status", el: @order, el_old: el_old)
          redirect_to action: :index, tab: Order::Statuses[i+1].downcase and return
        else
          notification_order_status(msg: Notification::Error, action: "updated status", el: @order, el_old: el_old)
        end
      end
    end
    redirect_to action: :index,tab: @order.status.downcase and return
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
