class ReviewsController < ApplicationController
  before_action :set_plant, only: %i[new create]
  before_action :set_user, only: %i[new create]
  before_action :authenticate_user!, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.plant = @plant
    @review.user = current_user
    if @review.save
      redirect_to plant_path(@plant), notice: "Thank you for adding a review."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def  set_user
    @user = current_user
  end

  def set_plant
    @plant = Plant.find(params[:plant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
