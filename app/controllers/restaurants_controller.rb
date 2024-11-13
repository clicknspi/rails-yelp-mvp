class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurants = Restaurant.all
  end

  def new
    @restaurant =Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
      if@restaurant.save
        redirect_to @restaurant
      else
        render :new
      end
  end

  private
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end
end
  def edit
  end

  def update
  end

  def destroy
  end
end
