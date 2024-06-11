class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :score, presence: true, inclusion: { in: 1..5 }
  validates :user, uniqueness: { scope: :product, message: "can only rate a product once" }
end
