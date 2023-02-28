class PlantsController < ApplicationController
  before_action :set_plant, only: %i[show edit update destroy]
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

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to dashboard_path
  end

  private

  def plant_params
    params.require(:plant).permit(:title, :description, :price, :city)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
