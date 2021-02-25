class Hero < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  # has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_name_skill_description,
    against: {
      name: 'A',
      skill: 'B',
      description: 'C'
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
