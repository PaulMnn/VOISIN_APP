class Reservation < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :start_date, :end_date, :total_price, presence: true
  validate :end_date_after_start_date

  before_validation :set_total_price

  def total_days
    (end_date - start_date).to_i + 1
  end

  private

  def set_total_price
    self.total_price = item.price.to_f * total_days
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end
end
