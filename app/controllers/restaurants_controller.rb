class RestaurantsController < ApplicationController


  before_action :find_restaurant, only: [:show, :edit, :destroy, :update]

  def index
    @restaurants = Restaurant.all
    if params[:search]
      if params[:search][:query]
        @restaurantresult = restaurant.find_by(name: params[:search][:query])
        if @restaurantresult
          redirect_to restaurant_path(@restaurantresult)
        else
          # redirect_to action:'index', alert: "restaurant not found"
          # flash.alert
          flash[:error] = 'restaurant not found'
          redirect_to action: 'index', danger: "restaurant not found"
        end
      end
    end
  end

  def show
    @meals = Meal.where(restaurant_id: @restaurant.id)

  end

  def new
    @restaurant = restaurant.new
  end

  def create
    @restaurant = restaurant.new(restaurants_params)
    @restaurant.save
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurants_params)

    redirect_to restaurant_path
  end

  private

  def find_restaurant
    @restaurant = restaurant.find(params[:id])
  end

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :telephone, :photo)
  end
end
