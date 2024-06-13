class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :ratings, dependent: :destroy

  validates :content, presence: true
end
