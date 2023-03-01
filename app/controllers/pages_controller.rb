class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
  end

  def dashboard
    @user = current_user
    @plants = current_user.plants
    @bookings = current_user.bookings
  end
end
