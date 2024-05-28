class Item < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 6 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
