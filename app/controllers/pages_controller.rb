class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @plants = current_user.plants
    @bookings = current_user.bookings
  end
end
