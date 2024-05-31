class ReservationsController < ApplicationController
  before_action :set_item, only: %i[create new]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.item = @item
    @reservation.user = current_user
    if @reservation.save!
      redirect_to item_reservation_path(@item, @reservation), notice: 'Réservation confirmée.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_reservations
    @reservations = current_user.reservations.includes(:item)
  end

  def index
    @items = Item.all
    @reservations = Reservation.includes(:user, :item).all
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
