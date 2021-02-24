class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update, :destroy]
  def index
    @heros = policy_scope(Hero)
  end

  def show
    authorize @hero
    @booking = Booking.new
  end

  def new
    @hero = Hero.new
    authorize @hero
  end

  def create
    # @user = User.find(params[:user_id])
    @hero = Hero.new(hero_params)
    @hero.user = current_user
    authorize @hero
    if @hero.save
      redirect_to hero_path(@hero)
    else
      render :new
    end
  end

    # PATCH/PUT /heros/1
  def update
    if @hero.update(hero_params)
      authorize @hero
      redirect_to hero_path(@hero), notice: 'Hero was successfully updated.'
    else
      render 'new'
    end
  end

  def destroy
    authorize @hero
    @hero.destroy
    redirect_to heros_path
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :description, :price, :skill, photos: [])
  end

  def set_hero
    @hero = Hero.find(params[:id])
  end
end
