class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def index
    @plants = Plant.all
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end

  private

  def plant_params
    params.require(:plant).permit(:title, :description, :price, :photo, :city)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
