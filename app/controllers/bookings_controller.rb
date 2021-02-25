class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    @hero = Hero.find(params[:hero_id])
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def create
    @hero = Hero.find(params[:hero_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.hero = @hero
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
      # redirect_to hero_path(@booking.hero)
    else
      render :new
    end
  end

  def update
    if @booking.update(booking_params)
      authorize @booking
      redirect_to booking_path(@booking), notice: 'Booking was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time, :description)
  end

  def set_booking
    @booking = Booking.where(user: current_user).find(params[:id])
  end
end
