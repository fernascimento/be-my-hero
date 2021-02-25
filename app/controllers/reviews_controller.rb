class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  def index
    @reviews = policy_scope(Review)
  end

  def show
    authorize @review
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    authorize @review
  end

  def edit
    authorize @review
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    # @review.booking.user = current_user
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      authorize @review
      redirect_to booking_path(@booking), notice: 'Booking was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to bookings_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def set_review
    @review = Review.where(user: current_user).find(params[:id])
  end
end
