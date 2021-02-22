class HeroesController < ApplicationController
  def index
    Hero.all
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def new
    @hero = Hero.new
  end

  def create
    @user = User.find(params[:user_id])
    @hero = Hero.new(hero_params)
    @hero.user = @user
    if @hero.save
      redirect_to hero_path(@hero)
    else
      render 'new'
    end
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :description, :price, :skill)
  end
end
