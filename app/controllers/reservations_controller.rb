class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if params[:reservation][:user_name].blank?
      authenticate_user!
    else
      @reservation.status = Reservation::New
    end
    @reservation.user = current_user if current_user
    if @reservation.save
      redirect_to reservation_path(@reservation)
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

  def change_status_declined
    @reservation = Reservation.find(params[:id])
    @reservation.status = Reservation::Declined
    @reservation.save
    redirect_to profile_path(tab: 'reservations')
  end

  private

  def reservation_params
    params.require(:reservation).permit(:table_id, :order_id, :release_at,
    :user_id, :s, :user_name)
  end
end
