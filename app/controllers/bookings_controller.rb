class BookingsController < ApplicationController
  #before_action :set_booking, only: %i[show edit update destroy search index new create destroy]
  before_action :set_plant, only: %i[new index create show edit update destroy]

  def index
    @bookings = Booking.all
  end

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
    @booking.save
    redirect_to plant_path(@plant), notice: "Thank you for booking #{@plant.title}."
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  def search
    @bookings = Booking.search(params[:search])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  private

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :plant_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
