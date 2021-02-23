class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update, :destroy]
  def index
    # Hero.all
    @heros = policy_scope(Hero)
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def new
    @hero = Hero.new
    authorize @hero
  end

  def edit
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.user = current_user
    authorize @hero
    if @hero.save
      redirect_to hero_path(@hero)
    else
      render 'new'
    end
  end

    # PATCH/PUT /heros/1
  def update
    if @hero.update(hero_params)
      redirect_to hero_path(@hero), notice: 'Hero was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /heros/1
  def destroy
    @hero.destroy
    redirect_to heros_path, notice: 'Successfully destroyed.'
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :description, :price, :skill)
  end

  def set_hero
    @hero = Hero.find(params[:id])
    authorize @hero
  end
end
