class Booking < ApplicationRecord
  belongs_to :hero
  belongs_to :user
  # has_many :reviews

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true
end
