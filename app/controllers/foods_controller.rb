class FoodsController < ApplicationController

def index
if current_user == nil
	redirect_to root_path
elsif current_user.email.include? 'admin@admin.com'
	@restaurant = Restaurant.find(params[:restaurant_id])
else
	redirect_to root_path
end

end

def new
	if current_user.email.include? 'admin@admin.com'
		@restaurant = Restaurant.find(params[:restaurant_id])
		@food = Food.new
	else 
		redirect_to root_path
	end
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
if current_user.email.include? 'admin@admin.com'
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:id])
else
	redirect_to root_path
	end
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
if current_user.email.include? 'admin@admin.com'
@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:id])
	@food.destroy!
	redirect_to :action => :index
else
	redirect_to root_path
end
end

private

def food_params
	params.require(:food).permit(:avatar)
end

end
