class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :review, optional: true

  validates :score, presence: true
end
