class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than: 0 }
  validates :description, presence: true
end
