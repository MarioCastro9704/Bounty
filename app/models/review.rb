class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :rating, dependent: :destroy

  validates :content, presence: true
end
