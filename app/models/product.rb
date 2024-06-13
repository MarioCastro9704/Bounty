class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_attributes,
    against: %i[model description brand],
    associated_against: {
      category: :name
    },
    using: {
      tsearch: { prefix: true }
    }
  belongs_to :user
  belongs_to :category
  has_many :purchases
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_one_attached :image

  before_validation :sanitize_price

  validates :category_id, :price, :description, :model, :brand, :release_date, :quantity_available, :size, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_available, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999999 }

  def average_rating
    if ratings.count > 0
      ratings.average(:score).to_f.round(2)
    else
      0
    end
  end

  private

  def sanitize_price
    if price.present?
      self.price = price.to_s.gsub(/[^0-9.]/, '').to_f
    end
  end
end
