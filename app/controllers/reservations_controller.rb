class ReservationsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]

  def index
    if current_user.person.has_any_role? :boss, :manager
      @reservations = Reservation.active
    else
      @reservations = Reservation.accepted
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if params[:reservation][:email].blank?
      authenticate_user!
    else
      @reservation.status = Reservation::New
    end
    @reservation.user = current_user if current_user
    if @reservation.save
      session[:reservation]= @reservation.id if !current_user
      redirect_to menu_path, notice: 'You can create an order'
    else
      render :new
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :show
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to reservations_path
    end
  end

  def change_status_accepted
    @reservation = Reservation.find(params[:id])
    @reservation.update_attributes(status: Reservation::Accepted)
    redirect_to :back
  end

  def change_status_declined
    @reservation = Reservation.find(params[:id])
    @reservation.update_attributes(status: Reservation::Declined)
    redirect_to :back
  end

  private

  def reservation_params
    params.require(:reservation).permit(:table_id, :order_id, :release_at,
    :user_id, :s, :email)
  end
end
