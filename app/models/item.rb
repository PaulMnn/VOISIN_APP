class Item < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :picture

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 6 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
