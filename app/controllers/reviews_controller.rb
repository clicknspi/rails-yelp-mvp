class ReviewsController < ApplicationController
  before_action :set_restaurant
  def new
    @review = @restaurant.reviews.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)
    if @review.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(params[:review])
      redirect_to @review, notice: 'Review updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
   if @review.destroy
     redirect_to reviews_path, status: :see_other, notice: 'Review deleted successfully.'
   else
      redirect_to reviews_path, status: :see_other, notice: 'Failed to delete review.'
   end
  end
end
