class Reservation < ApplicationRecord
  belongs_to :item
  validates :start_date, :end_date, :price, presence: true
  validate :end_date_after_start_date

  def total_days
    (end_date - start_date).to_i
  end

  def total_cost
    price * total_days
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end
end
