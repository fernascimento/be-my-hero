class BookingsController < ApplicationController
  # before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  def index
    @bookings = Booking.where(user: current_user)
  end
end
