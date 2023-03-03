class PagesController < ApplicationController
  before_action :set_plant, only: %i[dashboard]
  before_action :set_user, only: %i[dashboard myplants]
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def dashboard
    @plants = current_user.plants
    @bookings = current_user.bookings
  end

  def myplants
    @plants = current_user.plants
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
