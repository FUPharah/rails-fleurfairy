class BookingsController < ApplicationController
  before_action :set_plant, only: %i[new create edit update]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_user, only: %i[show]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.plant = @plant
    @booking.user = current_user
    if @booking.save
      redirect_to plant_path(@plant), notice: "Thank you for booking #{@plant.title}."
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  def search
    @bookings = Booking.search(params[:search])
  end

  def edit
    @booking = Booking.find(params[:id])
    @booking.save
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :plant_id)
  end
end
