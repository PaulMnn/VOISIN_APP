class ChangeTotalPriceTypeOnReservations < ActiveRecord::Migration[7.1]
  def change
    change_column(:reservations, :total_price, :float)
  end
end
