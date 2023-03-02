class PlantsController < ApplicationController
  before_action :set_plant, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @plant = Plant.new
  end

  def index
    @plants = Plant.all
    @markers = @plants.geocoded.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {plant: plant}),
        marker_html: render_to_string(partial: "marker", locals: {plant: plant})
      }
    end
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

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    redirect_to dashboard_path
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
    params.require(:plant).permit(:title, :description, :price, :city, :photo)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
