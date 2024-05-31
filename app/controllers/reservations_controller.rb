class ReservationsController < ApplicationController
  before_action :set_item, only: [:create, :new]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.item = @item
    @reservation.user = current_user
    if @reservation.save
      redirect_to @reservation, notice: 'Réservation confirmée.'
    else
      render :new
    end
  end

  def index
    @reservations = @item.reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
