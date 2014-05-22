class FoodsController < ApplicationController

def index
@restaurant = Restaurant.find(params[:restaurant_id])

end

def new
@restaurant = Restaurant.find(params[:restaurant_id])
@food = Food.new
end

def create
@restaurant = Restaurant.find(params[:restaurant_id])
@food = Food.new ( food_params)
@food.name = params[:food][:name]
@food.price = params[:food][:price]
@food.description = params[:food][:description]
@food.save!

@restaurant.foods << @food
@restaurant.save!

redirect_to :restaurant_foods
end

def show
@restaurant = Restaurant.find(params[:restaurant_id])
@food = Food.find(params[:id])
end

def edit
@restaurant = Restaurant.find(params[:restaurant_id])
@food = Food.find(params[:id])
end

def update
@restaurant = Restaurant.find(params[:restaurant_id])
@food = Food.find(params[:id])
@food.name = params[:food][:name]
@food.price = params[:food][:price]
@food.description = params[:food][:description]
@food.save!

redirect_to :restaurant_foods
end

def destroy
@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:id])
	@food.destroy!
	redirect_to :action => :index
end

private

def food_params
	params.require(:food).permit(:avatar)
end

end
