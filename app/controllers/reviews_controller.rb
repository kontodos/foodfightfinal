class ReviewsController < ApplicationController
before_action :authenticate_user!
  def index
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
  end
	
  def new
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.new
  end
  
  def create
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.new
	
	@user = current_user
	
	@review.content = params[:review][:content]
	@review.posted_on = DateTime.now
	@review.rating = params[:review][:rating]
	@review.user = current_user
	
	@review.save!
	
	@food.reviews << @review
	@food.save!
	
	@user.reviews << @review
	@user.save!
	
	redirect_to restaurant_food_path(@restaurant.id, @food.id)
  end
  
  def edit
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.find(params[:id])
  end
  
  def update
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.find(params[:id])
	
	@review.content = params[:review][:content]
	@review.posted_on = DateTime.now
	@review.rating = params[:review][:rating]
	
	@review.save!
	
	redirect_to restaurant_food_path(@restaurant.id, @food.id)
  end
  
  def destroy
	@restaurant = Restaurant.find(params[:restaurant_id])
	@food = Food.find(params[:food_id])
	@review = Review.find(params[:id])
	@review.destroy!
	redirect_to restaurant_food_path(@restaurant.id, @food.id)
  end
  
end
