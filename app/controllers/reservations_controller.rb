class ReservationsController < ApplicationController
  before_action :set_item

  def new
    @reservation = @item.reservations.new
  end

  def create
    @reservation = @item.reservations.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to @item, notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  def index
    @reservations = @item.reservations
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
